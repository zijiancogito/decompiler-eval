#include <iostream>

int main()
{
    std::string literal = "0LL";
    for (int i = 0; i < literal.size(); i ++ ) {
        if (!((literal[i] >= '0' && literal[i] <= '9') || literal[i] == '.')) {
            std::cout << literal[i] << std::endl;
            literal.erase(i -- , 1);
        }
    }
    std::cout << literal << std::endl;
    return 0;
}