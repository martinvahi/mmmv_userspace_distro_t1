/*=========================================================================
Initial author of this file: Martin.Vahi@softf1.com
This file is in public domain.
The following line is a spdx.org license label line:
SPDX-License-Identifier: 0BSD

This program is a _very_rough_ tool for assessing, how many times a
virtual appliance runs slower than real hardware, specially if the
virtual appliance has a different CPU instruction set than the CPU
instruction set of the CPU that runs the virtual appliance. It does NOT
take to the account the slowdown that comes from CPU cache misses or
speedups that come from instruction pipelines or an instruction pipeline
advancements, instruction graphs (superscalar CPU architecture). This
program is meant to be used in conjunction with some time measurement
program like

    time mmmv_CPUoperationwaster_t1

It has been tested to compile with ("g++ --version")
g++ (Debian 12.2.0-14+deb12u1) 12.2.0
Copyright (C) 2022 Free Software Foundation, Inc.
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

with CXXFLAGS

     -march=native -mtune=native -ftree-vectorize -O3

on ("uname -a")
Linux terminal01 6.1.0-51-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.177-1 (2026-07-16) x86_64 GNU/Linux

Thank You for studying this program.
=========================================================================*/
#include <cstdio>
#include <iostream>
#include <stdexcept>

int main() {
    int i_err_code=0; // no errors
    //-----------------------------------------------------
    // The
    const int i_base=1000; // < ((2^16)/2)-1)=32767
    // shouldn't be "too big", because if a virtual machine runs at
    // 1/100 of the speed of real hardware, then the work that takes 1
    // second of real hardware takes about 100s ~ 2min in that kind of
    // virtual appliance.
    //
    // (1*(10^3))^3 = (10^9) = 1G ~ 1s with 1GHz
    //
    //-----------------------------------------------------
    int i_hash=0;
    const int i_size=sizeof(int);
    std::cout<<"\nsizeof(int)==" << i_size<<"\n";
    if (2<=i_size) {
        for(int ix_2=0; ix_2 < i_base ; ix_2++) {
            std::cout<<".";
            for(int ix_1=0; ix_1 < i_base ; ix_1++) {
                for(int ix_0=0; ix_0 < i_base ; ix_0++) {
                    //-----------------------------------------------------
                    i_hash+=(ix_0-ix_1+ix_2);
                    //-----------------------------------------------------
                } // for
            } // for
        } // for
    } else {
        i_err_code=1;
        std::cerr << "\e[31m i_size == " << i_size << " < 2 \e[39m";
    } // if
    std::cout<< "\n"<<"i_hash=="<<i_hash<<"\n\n";
    return i_err_code;
} // main

/*=========================================================================
S_VERSION_OF_THIS_FILE="64d62323-96d8-4821-8107-802150c19ae7"
=========================================================================*/
