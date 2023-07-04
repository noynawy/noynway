import matplotlib.pyplot as plt
import sys

# Sample data
ages = [int(arg) for arg in sys.argv[1:]]

plt.hist(ages, bins=10, edgecolor='black')

# Save the plot as an image
plt.savefig('outpic.jpg')
