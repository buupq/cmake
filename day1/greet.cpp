#include <iostream>
#include <boost/optional.hpp>
#include "greet.h"
void greet(bool do_greet) {
    boost::optional<std::string> message = do_greet ? boost::optional<std::string>("Greetings from Day 6!") : boost::none;
    if (message) std::cout << *message << "\n";
}

void welcome() {
    std::cout << "Welcome to CMake!" << std::endl;
}
