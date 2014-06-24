#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#ifdef __cplusplus
}
#endif

#include <cstring>
#include <iostream>
using namespace std;

class Osadmin {
public:
    Osadmin(char * cp, int n):s_(cp),n_(n) {
    }
    void right_trim () {
        s_.erase(s_.find_last_not_of(" \n\r\t")+1);
    }
    size_t get_length() {
        return s_.length();
    }

    // returns array ref of x strings s_ 
    SV * get_ar_x_s (size_t x) {
        AV * results = (AV *)sv_2mortal((SV *)newAV());
        for (size_t i=0; i < x; i++) {
            SV *rh = newSVpv( s_.c_str(), 0 );
            av_push(results, rh);
        }
        return newRV((SV *)results);
    }
    
    // returns array ref of x numbers n_ 
    SV * get_ar_x_n (size_t x) {
        AV * results = (AV *)sv_2mortal((SV *)newAV());
        for (size_t i=0; i < x; i++) {
            SV *rh = newSViv( n_ );
            av_push(results, rh);
        }
        return newRV((SV *)results);
    }

    int get_n() {
        return n_;
    }

    ~Osadmin() { 
    }

private:
    string s_;
    int    n_;
};

MODULE = Osadmin		PACKAGE = Osadmin		

PROTOTYPES: ENABLE

Osadmin *
Osadmin::new(char * cp, int n)

void
Osadmin::right_trim()

size_t
Osadmin::get_length()

SV *
Osadmin::get_ar_x_s(size_t x)

SV *
Osadmin::get_ar_x_n(size_t x)

void
Osadmin::DESTROY()

void
Osadmin::get_a_x_n(size_t x)
PPCODE:
    for (int i=0; i<x; i++) {
        XPUSHs(sv_2mortal(newSViv(THIS->get_n())));
    }


