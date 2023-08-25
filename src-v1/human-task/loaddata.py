import sqlite3
import difflib
import os
import argparse
from tqdm import tqdm

USERNAME = '0xdd96'
CHALLS = {
    'BinaryNinja': ['winkey', 'malware', 'rotterdam'],
    'Ghidra': ['rootkit', 'dublin', 'leipzig'],
    'Hex-Rays': ['demesne', 'malware', 'rotterdam'],
    'RetDec': ['dublin', 'leipzig', 'prime']
}

DBS = {
    'BinaryNinja': '/home/eval/survey/release/binja/server/instance/development.db',
    'Ghidra': '/home/eval/survey/release/ghidra/server/instance/development.db',
    'Hex-Rays': '/home/eval/survey/release/ida/server/instance/development.db',
    'RetDec': '/home/eval/survey/release/retdec/server/instance/development.db',
}

class Data:
    def __init__(self, db_path, decompiler) -> None:
        self._challs = CHALLS[decompiler]
        self._username = USERNAME
        self._con = sqlite3.connect(db_path)
        self._cur = self._con.cursor()

        self._userid = self._cur.execute(f"SELECT id FROM accounts WHERE name='{self._username}'").fetchall()[0][0]

        self.differ = difflib.HtmlDiff()

    def get_chall_id(self, chall_name):
        # print(self._cur.execute(f"PRAGMA table_info('challenges')").fetchall())
        # print(self._cur.execute(f"SELECT id, name FROM challenges").fetchall())
        chall_id = self._cur.execute(f"SELECT id FROM challenges WHERE name='{chall_name}'").fetchall()[0][0]
        return chall_id

    def get_submission(self, chall_name):
        # print(self._cur.execute("PRAGMA table_info('submissions')").fetchall())
        chall_id = self.get_chall_id(chall_name)
        cmd = f"SELECT id, created_at, submission, score, test_score, diff_score FROM submissions WHERE challenge_id={chall_id} and user_id={self._userid} ORDER BY created_at"
        submissions = self._cur.execute(cmd).fetchall()
        return submissions

    @property
    def submission_tab_schema(self):
        print(self._cur.execute("PRAGMA table_info('submissions')").fetchall())

    def diff_html(self, submission_1, submission_2):
        html = self.differ.make_file(submission_1.splitlines(), submission_2.splitlines())
        return html

    def ndiff(self, submission_1, submission_2):
        diffs = difflib.ndiff(submission_1.splitlines(), submission_2.splitlines())
        final_diffs = []
        for df in diffs:
            if df.startswith(' '):
                continue
            final_diffs.append(df)
        return final_diffs

def submissions_diff(data, submissions, save_to):
    sub_dir = os.path.join(save_to, 'html')
    if not os.path.exists(sub_dir):
        os.makedirs(sub_dir)
        
    for idx in tqdm(range(len(submissions)-1)):
        s1 = submissions[idx]
        s2 = submissions[idx + 1]

        html = data.diff_html(s1[2], s2[2])
        html_f = os.path.join(sub_dir, f"diff-{s1[0]}_{s2[0]}.html")
        with open(html_f, 'w') as f:
            f.write(html)

def submissions_log(submissions, save_to):
    subm_infos = []
    for subm in submissions:
        id = subm[0]
        created_at = subm[1]
        score = subm[3]
        test_score = subm[4]
        diff_score = subm[5]
        subm_infos.append(f"{created_at}\t{id}\t{round(score, 2)}\t{round(test_score, 2)}\t{round(diff_score, 2)}\n")

    log_path = os.path.join(save_to, "log.txt")
    with open(log_path, 'w') as f:
        f.writelines(subm_infos)

def decompiler_process(decompiler, save_to):
    db_path = DBS[decompiler]
    data = Data(db_path, decompiler)
    for chall in data._challs:
        save_sub_dir = os.path.join(save_to, decompiler, chall)
        if not os.path.exists(save_sub_dir):
            os.makedirs(save_sub_dir)

        submissions = data.get_submission(chall)
        submissions_log(submissions, save_sub_dir)
        submissions_diff(data, submissions, save_sub_dir)
    
def process_all(decompilers, save_to):
    for decompiler in decompilers:
        decompiler_process(decompiler, save_to)

def test():
    db_path = '/home/eval/survey/release/ghidra/server/instance/development.db'
    data = Data(db_path, 'Ghidra')

    for ch in data._challs:
        # print(data.get_chall_id(ch))
        print(len(data.get_submission(ch)))

if __name__ == '__main__':
    parser = argparse.ArgumentParser(prog='loaddata.py', description='human study data process')
    parser.add_argument('-o', '--output', type=str, help="dec dir")
    parser.add_argument('-D', '--decompilers', nargs='+', help="Decompilers")


    args = parser.parse_args()

    process_all(args.decompilers, args.output)


# cur.execute("PRAGMA table_info('accounts')")
