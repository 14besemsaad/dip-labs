from PIL import Image
import numpy as np

from copy import copy

class LinearTransform:
    def intensityScale(self, image, a):
        image = copy(image)
        for x in range(image.size[0]):
            for y in range(image.size[1]):
                r = image.getpixel((x,y))
                s = int(a * r)
                image.putpixel((x,y), (s))
        return image

    def invert(self, image):
        image = copy(image)
        for x in range(image.size[0]):
            for y in range(image.size[1]):
                r = image.getpixel((x,y))
                s = int(255 - r)
                image.putpixel((x,y), (s))
        return image

image = Image.open("res/cameraman.tif").convert("L")

linTrans = LinearTransform()

bright = linTrans.intensityScale(image, 5)
bright.show()

dark = linTrans.intensityScale(image, 0.5)
dark.show()

neg = linTrans.invert(image)
neg.show()