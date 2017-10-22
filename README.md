# deeplearning_hse

Выполнили: студенты группы 16 МАГ ИАД Волкович Полина и Павлова Елена.

Задача: Необходимо разработать компьютерную программу, которая будет использовать методы
deep learning для решения задачи: Распознавание изображений из небольшого набора данных (например, Caltech-101) с помощью дообучения (fine-tuning) заранее обученной глубокой нейронной сети (например, GoogLeNet, VGGNet, ResNet,...)

# Fine-tuning 
Если имеется небольшая база данных, то построение и обучение займет слишком много времени. Вместо этого можно отточить существующую предобученную сеть. Реализация такой техники занимает гораздно меньше времени за счет того, что мы берем слои из предобученной модели, а переобучаем самые последние. 

Порядок fine-tuning:

1. Подгружаем предобученную сеть. 

2. "Замораживаем" все слои кроме последних трех. 

3. Уменьшаем скорость обучения на "замороженных" слоях. 

4. Заменяем последние три слоя исходной сети на Fully Connected, SoftMax и Classification Output слои.

5. Устанавливаем параметры нового Fully Connected слоя согласно нашим данным.

В качестве алгоритма оптимизации используется стохастический
градиентный спуск.  



# Требования
cv2 3.0.0

python 3.5.2

anaconda 1.5.1

matlab R2017b с пакетами:

•	Data Analytics

•	Image Processing and Computer Vision

•	Signal Processing and Communications

•	Neural Network Toolbox

•	Statistics and Machine Learning Toolbox


# Полезные ссылки
Matlab https://www.mathworks.com/programs/trials/trial_additional_info.html?em=pavolkovich@edu.hse.ru&product_info=ML&&

База данных Caltech101 сайт http://www.vision.caltech.edu/Image_Datasets/Caltech101/

# Предобработка
Перед тем как подать картинки из базы данных Сaltech101 на вход, мы провели препроцесинг изображений из всех категорий в Python. 

Запускаем preprocessing.py в Jupiter Notebook. Далее в Matlab для AlexNet запускаем runAlexNet.m, а для VGG16 запускаем runVGG16.m
