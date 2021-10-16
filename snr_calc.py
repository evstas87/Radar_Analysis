# importing the required modules
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# %% Inputs:
# % pt       == input peak power in dB
# % pw       == pulse width in sec
# % pulse    == coherent pulse number
# % gain_tr  == transmite Gain in dB
# % gain_rec == receive Gain in dB
# % lambda == wave length im Meter
# % sigma == radar cross section in meter squared
# % nf == noise Figure in dB
# % loss == total radar losses in dB
# % range == range to target (single value or vector) in Km% % Outputs:
# % snr == SNR in dB
# %
#
pt      = 15*256
pw      = 100*pow(10, -6)
pulse_num=10
gain_tr_db = 28
gain_rec_db= 26
rf_freq = 3.1*pow(10, 9)
c       = 3*pow(10, 8)
sigma   = 2
nf      = 5
loss    = 10
range   = np.arange(1000,100000,1000)

# calculations
lam = c/rf_freq
pt_db         = 10*np.log10(pt)
pw_db         = 10*np.log10(pw)
pulse_num_db  = 10*np.log10(pulse_num)
lamb_sqdb     = 20*np.log10(lam)      # compute wavelength square in dB
sigmadb       = 10*np.log10(sigma)    # convert sigma to dB
four_pi_cub   = 30*np.log10(4.0 * np.pi)        # (4pi)^3 in dB
k_db          = 10*np.log10(1.38*pow(10, -23)) # Boltzman's constant in dB
to_db         = 10*np.log10(290)              # noise temp. in dB
range_pwr4_db = 40*np.log10(range)            # vector of target range^4 in dB

num = pt_db + pw_db + pulse_num_db + gain_tr_db + gain_rec_db + lamb_sqdb + sigmadb
den = four_pi_cub + k_db + to_db + nf + loss + range_pwr4_db
snr = num - den



# setting the x - coordinates
x = range
# setting the corresponding y - coordinates
y = snr

# plotting the points
plt.plot(x, y)

# x-axis label
plt.xlabel('Range [km]')
# frequency label
plt.ylabel('SNR [db]')
# plot title
plt.title('SNR vs Range')
# showing legend
plt.legend('SNR')

# function to show the plot
plt.show()