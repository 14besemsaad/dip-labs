from PIL import Image
import numpy as np

from copy import copy
from math import log, pow

def maxIntensity(image):
    M = np.amax(np.array(image))
    return M

class LogarithmicTransform:
    def logTransform(self, image, c):
        image = copy(image)
        M = maxIntensity(image)
        for x in range(image.size[0]):
            for y in range(image.size[1]):
                r = image.getpixel((x,y)) / float(M)
                s = c * log(1 + r)
                try:
                    image.putpixel((x,y), int(s * M))
                except:
                    image.putpixel((x,y), 255)  
        return image

    def powerLaw(self, image, c, y):
        image = copy(image)
        M = maxIntensity(image)
        for x in range(image.size[0]):
            for y in range(image.size[1]):
                r = image.getpixel((x,y)) / float(M)
                s = c * (r ** y)
                try:
                    image.putpixel((x,y), int(s * M))
                except:
                    image.putpixel((x,y), 255)                    
        return image

image = Image.open("res/tire.tif").convert("L")

trans = LogarithmicTransform()

for c in [1, 2, 5]:
    trans.logTransform(image, c).show()

for y in [0.4, 0.1, 1, 2.5, 10]:
    trans.powerLaw(image, 1, y).show()