// SPDX-FileCopyrightText: Freedesktop-SDK Developers
// SPDX-License-Identifier: MIT

#include <iostream>
#include <cfloat>
#include <cmath>
#include <complex>
#include <limits>

int main ()
{
    double inf = std::numeric_limits<double>::infinity();
    double pi = std::numbers::pi;
    std::complex<double> x (0, inf);
    std::complex<double> y (0, 0);
    std::complex<double> z (inf, pi/2);
    y = std::log(x);
    std::cout << "x = " << x << " log(x) = " << y << std::endl;
    if ((y.real() == z.real()) && ((y.imag() - z.imag()) < DBL_EPSILON))
        return 0;
    return 1;
}
