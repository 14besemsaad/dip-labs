Saad Bilal
BESE 5A

from PIL import Image
import numpy as np


# Reading an image
image = Image.open("res/sample1.png")


##############################################################################
# Task 2: Use any image and separate red, green and blue component/ channel  #
# in image.                                                                  #
##############################################################################
def filter_channel(image, r, g, b):
    a = np.array(image)
    a[:, :, 0] *= r
    a[:, :, 1] *= g
    a[:, :, 2] *= b
    return Image.fromarray(a).convert("L")

red = filter_channel(image, 1, 0, 0)
red.show()

green = filter_channel(image, 0, 1, 0)
green.show()

blue = filter_channel(image, 0, 0, 1)
blue.show()


##############################################################################
# Task 3: Read any image (using imread command) then resize it and then      #
# store it bmp format.                                                       #
##############################################################################
resized = image.resize((200, 200))
resized.save("res/sample1_resized.bmp")