import pytest
from mylist import list_lshift


class Test_List_Shift():
    def setup_class(self):
        print("-------->setup_method")

    def teardown_class(self):
        print('-------->teardown_method')

    def test_a(self):
        lst = [2, 1, 3]
        list_lshift(lst)
        assert lst == [1, 3, 2], f"Case 1 not pass. Expect [1, 3, 2], get {lst}."

    def test_b(self):
        lst = [1, 2, 3]
        list_lshift(lst)
        assert lst == [1, 2, 3], f"Case 2 not pass. Expect [1, 2, 3], get {lst}"

    def test_c(self):
        lst = [3, 2, 1]
        list_lshift(lst)
        assert lst == [1, 3, 2], f"Case 3 not pass. Expect [1, 3, 2], get {lst}"

if __name__ == '__main__':
    pytest.main("-s test_mylist.py")
