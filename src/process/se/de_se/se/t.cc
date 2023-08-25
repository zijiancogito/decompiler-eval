#include <iostream>
#include <jsoncpp/json/json.h>

int main()
{
    Json::Value o = Json::arrayValue;
    Json::Value p;
    p["0-1"] = o[0];
    std::cout << p.toStyledString() << std::endl;
}

