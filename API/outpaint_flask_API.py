# -*- coding: utf-8 -*-
"""
Created on Thu Mar 17 14:57:41 2022

@author: Amr Salama
"""

import os
os.environ["KMP_DUPLICATE_LIB_OK"]="TRUE"
from outpaint_function import *
import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt
from flask import Flask,request,jsonify
import cv2


app = Flask(__name__)
gen_model = load_model('F:\Amr Salama\Outpaint\Exp_Models\Center_final_1000.pt')
ResNet_model = tf.keras.models.load_model(r'C:\Users\Amr Salama\Desktop\Resnet50_train\ResNet_Classification_egy.h5')
categories = ['Amenemhat III','Bust of an elderly man with short hair','Hakuno','Hatchebsout','Head Of Queen Tiye','Heteb','King Chephren','Mask of Thuya','Mask of Yuya','Mother Of King Thutmose III','Narmer_paltte','Nefertiti','OsorkonII','RamsesII','Senwsret III','Sontm','Statue en granit gris','Statue of Mentuhotep Nebheptre','Statuette of King Seti I','The Priest Hetepdief','Thutmose III','Tout ankh amon','Userkaf','champollion',]
@app.route('/upload',methods =["POST"])
def upload():
    if(request.method== "POST"):
        imgee = request.files['image']
        filename = imgee.filename
        path = os.path.join("D:/MIU/University/Year 4/Gradution Project/Mobile APP/Image_uploud/"+filename)
        imgee.save(path)
        img_path =path
        image = cv2.imread(img_path)
        image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
        image = cv2.resize(image, (192, 192))
        #resized_path=r"D:\MIU\University\Year 4\Gradution Project\Mobile APP\Image_uploud\output"
        cv2.imwrite(r"D:\MIU\University\Year 4\Gradution Project\Mobile APP\Image_uploud\output\res.jpg",image)
        resized_path=r"D:\MIU\University\Year 4\Gradution Project\Mobile APP\Image_uploud\output\res.jpg"
        #Croped = center_crop(resized_path)
        #input_img = cv2.imread(r"D:\MIU\University\Year 4\Gradution Project\Mobile APP\Image_uploud\output\croped1.jpg")[:, :, :3]
        
        output_img, blended_img = perform_outpaint(gen_model, image)
        #cv2.imwrite(r"D:\MIU\University\Year 4\Gradution Project\Mobile APP\Image_uploud\output\output.jpg", blended_img)
        plt.imsave(r"D:\MIU\University\Year 4\Gradution Project\Mobile APP\Image_uploud\output\output.jpg", blended_img)
        img_path=r"D:\MIU\University\Year 4\Gradution Project\Mobile APP\Image_uploud\output\output.jpg"
        #plt.imread(r"D:\MIU\University\Year 4\Gradution Project\Mobile APP\Image_uploud\output\output.jpg")
        img = tf.keras.utils.load_img(img_path, target_size=(224, 224))
        x = tf.keras.utils.img_to_array(img)
        x = np.expand_dims(x, axis=0)
        preds = ResNet_model.predict(x)
        print("Model predicts a \"{}\" with {:.2f}% probability".format(categories[np.argmax(preds[0])], preds[0][np.argmax(preds)] * 100))
        output = categories[np.argmax(preds[0])]
        print(output)
        return jsonify({
            "massege":"Done",
            "output": output
            })

if __name__ =="__main__":
    app.run(debug=False, port=4000)