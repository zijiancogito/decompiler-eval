import os
import difflib

from loaddata import Data, CHALLS

def diff_text(text_1: str, text_2: str):
    differ = difflib.HtmlDiff()
    diff_html = differ.make_file(text_1.splitlines(), text_2.splitlines())
    return diff_html

def ndiff(text_1: str, text_2: str):
    diffs = difflib.ndiff(text_1.splitlines(keepends=True), text_2.splitlines(keepends=True))
    return diffs

def test():
    db_path = '/home/eval/survey/release/ghidra/server/instance/development.db'
    data = Data(db_path, 'Ghidra')

    subs = data.get_submission(CHALLS['Ghidra'][0])

    diffs = ndiff(subs[0][2], subs[1][2])
    for df in diffs:
        if df.startswith(' '):
            continue
        print(df.strip())
    # with open('test.html', 'w') as f:
        # f.write(html)

if __name__ == '__main__':
    test()
