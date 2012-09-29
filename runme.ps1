#Fortonei to arxeio functions.ps1 me tis sinartiseis
. "./functions.ps1"

#Arxikopoiei to path sto directory pou exei mpei to scriptaki
$path = pwd

#Trexei tin sinartisi gia na metrisi posous fakelous kai posa
#arxeia iparxoun sto $path

$ans = countfds($path)

checking $ans $path
