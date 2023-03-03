#include <iostream>

int main()
{
    std::string literal = "0xFFFFFFFFuLL";
    std::string sss = "4294967287LL";
    char aaa[100];

    sprintf(aaa, "%llx", std::stoll(sss));
    std::cout << aaa << std::endl;

    int i;
    sscanf(literal.c_str(), "%x", &i);

    std::cout << i << std::endl;
    return 0;
}