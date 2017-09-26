from PIL import Image
import numpy as np

from copy import copy
import matplotlib.pyplot as plt

def plot(map):
    hist = [0] * 256
    for k, v in map.iteritems():
        hist[k] = v

    plt.plot(hist)
    plt.show()

class HistorgramNormalizer:
    def normalize(self, image):
        image = copy(image)

        N = float(image.size[0] * image.size[1])
        map = dict()
        for x in range(image.size[0]):
            for y in range(image.size[1]):
                i = image.getpixel((x,y))
                if i not in map.keys():
                    map[i] = 1
                else:
                    map[i] += 1

        plot(map)

        for k in map.keys():
            map[k] /= N

        plot(map)
        
        sum = 0.0
        for k in sorted(map):
            sum += map[k]
            map[k] = int(round(sum * 255, 0))

        plot(map)
        
        for x in range(image.size[0]):
            for y in range(image.size[1]):
                i = image.getpixel((x,y))
                image.putpixel((x,y), map[i])

        return image


image = Image.open("res/cameraman.tif").convert("L")

norm = HistorgramNormalizer()

newImage = norm.normalize(image)
image.show()

norm.normalize(newImage)
newImage.show()