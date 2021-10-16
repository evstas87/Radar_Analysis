# importing the required modules
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


# read beam position
beam_pos_pass = 'c:/Users/evsta/Documents/Python/RadarAna/files/BeamPos.csv'
df = pd.read_csv(beam_pos_pass)

Az = df.Az
El = df.El

El_tilt = 20
az_bw0 = 7.8
el_bw0 = 7.8

# plotting the points
for i in range(len(Az)):
    d_pi = np.arange(0, 2*np.pi, 2*np.pi/1000)
    az_bw = az_bw0/np.cos(Az[i]*np.pi/180)
    el_bw = el_bw0/np.cos((El[i]-El_tilt)*np.pi/180)
    plt.plot(Az[i] + az_bw/2 * np.cos(d_pi),
             El[i] + el_bw/2 * np.sin(d_pi), color='green')

plt.plot(Az, El, color='green', linestyle='none', linewidth=3,
         marker='o', markerfacecolor='blue', markersize=12)

# x-axis label
plt.xlabel('Az [deg]')
# frequency label
plt.ylabel('El [deg]')
# plot title
plt.title('Az vs El')
# showing legend
# plt.legend('Az')

# function to show the plot
plt.show()