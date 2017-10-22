# deeplearning_hse

Выполнили: студенты группы 16 МАГ ИАД Волкович Полина и Павлова Елена.

Задача: Необходимо разработать компьютерную программу, которая будет использовать методы
deep learning для решения задачи: Распознавание изображений из небольшого набора данных (например, Caltech-101) с помощью дообучения (fine-tuning) заранее обученной глубокой нейронной сети (например, GoogLeNet, VGGNet, ResNet,...)

# Требования
cv2 3.0.0

python 3.5.2

anaconda 1.5.1

matlab R2017b с пакетами:

•	Data Analytics

•	Image Processing and Computer Vision

•	Signal Processing and Communications


# Полезные ссылки
Matlab https://www.mathworks.com/programs/trials/trial_additional_info.html?em=pavolkovich@edu.hse.ru&product_info=ML&&

База данных Caltech101 сайт http://www.vision.caltech.edu/Image_Datasets/Caltech101/

# Предобработка
Перед тем как подать картинки из базы данных Сaltech101 на вход, мы провели препроцесинг изображений из всех категорий в Python. 

Запускаем preprocessing.py в Jupiter Notebook. Далее в Matlab для AlexNet запускаем runAlexNet.m, а для VGG16 запускаем runVGG16.m
