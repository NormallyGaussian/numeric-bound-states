# -*- coding: utf-8 -*-
"""
Created on Sat Apr 25 16:09:51 2015

@author: Matt Harris
"""
import numpy as np
from numpy.fft import fft, fftshift, ifft, ifftshift
import matplotlib.pyplot as plt

def sol(mu, R, N, L):
    dx = float(R)/float(N)
    x = np.arange(-R,R+dx,dx)
    N1 = x.shape[0]
    xi = np.arange(1,N1+1) - np.floor(N1/2.+1)
    absXIsquared = np.pi**2*xi**2/R**2
    u0 = init_guess(x,L)
    V = setV(x,L,N)
    uhat0 = fftshift(fft(u0));
    lambda0 = 1;
    what0 = uhat0/lambda0;
    
    for k in range(1,10):
        for j in range(1,10):
            lambda0 = lambda0 + ((sum((absXIsquared + mu)**(-1) \
                    *fftshift(fft(dnonlin(ifft(ifftshift(what0)),lambda0)))*what0.conj()))**(-1)) \
                *(sum((abs(what0)**2)) - sum((fftshift(fft(ifft(ifftshift(what0))*V))) \
                                            *(absXIsquared+mu)**(-1)*what0.conj()) - \
                sum((absXIsquared + mu)**(-1)*fftshift(fft(nonlin(ifft(ifftshift(what0)),lambda0)))*what0.conj()))
                
        what0 = (fftshift(fft((ifft(ifftshift(what0)))*V)))/(absXIsquared+mu) \
                + (fftshift(fft(nonlin(ifft(ifftshift(what0)),lambda0))))/(absXIsquared+mu)
    
        u1 = abs(ifft(ifftshift(lambda0*what0)))
        z = max(abs(u1-u0))
        u0 = u1

    return x, u0.real
# sum(dx*abs(u0)**2);

def init_guess(X,L):
    return np.exp(-X**2)
    
def setV(X,L,N):
    return 0

def nonlin(z, lambdain):
    return abs(lambdain*z)**2

def dnonlin(z, lambdain):
    return 2*lambdain*abs(z)**2
#test

a = sol(0.1,10,1000,0)
x = a[0]
y = a[1]
plt.plot(x,y)