#include <iostream>
#include <regex>

int main()
{
    // std::string literal = "0xFFFFFFFFuLL";
    // std::string sss = "4294967287LL";
    // char aaa[100];

    // sprintf(aaa, "%llx", std::stoll(sss));
    // std::cout << aaa << std::endl;

    // int i;
    // sscanf(literal.c_str(), "%x", &i);
    std::string pattern("(([^\\.]+\\.[^\\.]+)|([[:alnum:]]*->[[:alnum:]]*))");
    std::smatch results;
    std::regex r(pattern);
    std::string a("a.g");
    if (regex_search(a, results, r)) {
	    std::cout << true << std::endl;
    }
    return 0;
}