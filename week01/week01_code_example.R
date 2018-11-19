

# week01 ------------------------------------------------------------------
# 講者：余佑駿(littlefish)
# 時間：2018-11-09



# Ch01 --------------------------------------------------------------------
1+1
# 1+ # 會失敗，要去Console按Esc


# 存檔
# 儲存請選Save
# 如果要選編碼，請用UTF-8



# Ch02 --------------------------------------------------------------------
# 註釋語法
# 快速鍵是Ctrl+Shift+c


# 設定程式區塊
# 功能列表Code → Insert Section
# 快速鍵Ctrl+Shift+r



# Ch02向量 ----------------------------------------------------------------
# class(變數)，可以幫助我們檢視這個變數的資料型態
# 數值向量(numeric)
num_vector  <- 170
class(num_vector )
## [1] "numeric"

# 整數向量(integer)
int_vector  <- 170L
class(int_vector )
## [1] "integer"

# 文字向量(character)
chr_vector <- "Learn R the easy way"
class(chr_vector)
## [1] "character"

# 邏輯值向量(logical)
logi_vector <- TRUE
class(logi_vector)
## [1] "logical"


# 長度大於1的向量
nums <- c(170, 180)
nums
## [1] 170 180

ints <- c(170L, 180L)
ints
## [1] 170 180

chars <- c("Learn", "R", "the", "easy", "way")
chars
## [1] "Learn" "R"     "the"   "easy"  "way"

logicals <- c(TRUE, FALSE)
logicals
## [1]  TRUE FALSE





# Ch02向量取值、取代、新增 ----------------------------------------------------------
# 在[ ](中括號)中輸入元素的位置進行取值
x <- c(174, 158, 160, 168, 173)

x[1]           # 選取第1個位置的元素
## [1] 174

x[c(1, 3)]     # 選取第1, 3個位置的元素
## [1] 174 160

x[c(2, 3, 1)]  # 依序取值
## [1] 158 160 174

# 在[ ]中使用負號 (-) 做反向選取
x[-1]
## [1] 158 160 168 173

x[-c(1, 3, 4)]
## [1] 158 173



# 定條件進行取值
x <- c(174, 158, 160, 168, 173)
x > 160
## [1]  TRUE FALSE FALSE  TRUE  TRUE

# 使用比較運算子 加上 `which` 函數進行取值
index <- which(x > 160) 
index 
## [1] 1 4 5

x[index]
## [1] 174 168 173




# 指令壓縮
x[which(x > 160)]
## [1] 174 168 173

# 配合邏輯算子進行多條件的取值
x[which(x > 160 & x < 175)]
## [1] 174 168 173

x[x > 160 & x < 175] # 可以省略 which
## [1] 174 168 173





# 向量取代
x <- c(174, 158, 160, 168, 173)
x
## [1] 174 158 160 168 173

# 取代特定位置的元素
x[2] <- 158.5 # 取代x物件的第二個元素
x
## [1] 174.0 158.5 160.0 168.0 173.0

x[c(1, 5)] <- 175 
x
## [1] 175.0 158.5 160.0 168.0 175.0

# 也可以用條件篩選做取代
x[x > 160] <- 170 # 取代大於160的值為170
x
## [1] 170.0 158.5 160.0 170.0 170.0





# 向量新增
x <- c(174, 158, 160, 168, 173)
x
## [1] 174 158 160 168 173

# 在 [ ] 中新增元素
x[6] <- 168
x
## [1] 174 158 160 168 173 168

x[8] <- 147
x # 未指定的元素值預設為NA
## [1] 174 158 160 168 173 168  NA 147

length(x) # 查看向量物件的長度
## [1] 8

x[length(x) + 1] <- 166 # 接續增加新元素
x
## [1] 174 158 160 168 173 168  NA 147 166






# Ch02數列操作seq與運算 ----------------------------------------------------------
# 生成連續整數向量
1:4
## [1] 1 2 3 4

4:1
## [1] 4 3 2 1

seq(1, 4)
## [1] 1 2 3 4

seq(1, 9, by = 2) # 間隔為2
## [1] 1 3 5 7 9

seq(1, 9, length.out = 5) # 分割長度為5
## [1] 1 3 5 7 9








# R語言的數列運算滿足 recycling properties
c(1, 2, 3) * c(2, 2, 2)
## [1] 2 4 6

# shorter arguments are recycled
1:3 * 2
##[1] 2 4 6

c(0.5, 1.5, 2.5, 3.5) * c(2, 1)
## [1] 1.0 1.5 5.0 3.5







# Ch02求助、說明文件相關 -----------------------------------------------------------
help.start()
ab # 輸入`ab`後 按下tab
?abs   # 等同於 help(abs)
??abs 
apropos("abs")
vignette()
vignette("Introduction", "Matrix")








# Ch02其他數據型態 --------------------------------------------------------------
# 因子factor
temp1 <- factor(c(10, 22, 28, 10, 19, 30))
temp1
## [1] 10 22 28 10 19 30
## Levels: 10 19 22 28 30
# 電腦紀錄的方式為1,3,4,1,2,5
# 在對應回去levels就可以的到原始的紀錄

temp2 <- factor(c("低溫", "舒適", "高溫", "低溫", "舒適", "高溫"))
temp2 
## [1] 低溫 舒適 高溫 低溫 舒適 高溫
## Levels: 低溫 高溫 舒適
# 電腦紀錄的方式為1,3,2,1,3,2
# 在對應回去levels就可以的到原始的紀錄




# 矩陣matrix
matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
##      [,1] [,2] [,3] [,4]
## [1,]    1    2    3    4
## [2,]    5    6    7    8
## [3,]    9   10   11   12

matrix(1:12, nrow = 3, ncol = 4, byrow = FALSE)
##      [,1] [,2] [,3] [,4]
## [1,]    1    4    7   10
## [2,]    2    5    8   11
## [3,]    3    6    9   12

# 矩陣元素取得
A <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
A[3,1]
## [1] 9

A[1:3, 2]
## [1]  2  6 10




# 資料表/框data.frame
num <- 1:3
eng <- letters[1:3]
df <- data.frame(num, eng)
df
##   num eng
## 1   1   a
## 2   2   b
## 3   3   c

# 查詢欄名稱
names(df) # 亦可用colnames(df)
## [1] "num" "eng"

# 設定欄名稱
colnames(df) <- c("數字", "字母")

# 查詢列名稱
row.names(df)
## [1] "1" "2" "3"




# 列表/串立/清單list
x1 <- c("林志玲", 174, 52, TRUE) # 所有元素都被轉換成字串
x1
## [1] "林志玲" "174"    "52"     "TRUE"

x2 <- list("林志玲", 174, 52, TRUE) # 保留資料型態
str(x2) #str()可以檢視資料結構中的數據型態
## List of 4
## $ : chr "林志玲"
## $ : num 174
## $ : num 52
## $ : logi TRUE

x3 <- list(name=c("林志玲", "隋棠", "蔡依林"), 
           height=c(174, 173, 158),
           model=c(TRUE, TRUE, FALSE))
x3
## $name
## [1] "林志玲" "隋棠"   "蔡依林"
## 
## $height
## [1] 174 173 158
## 
## $model
## [1]  TRUE  TRUE FALSE



# 取出list中的資料
x3[[1]]
## [1] "林志玲" "隋棠"   "蔡依林"
x3$name
## [1] "林志玲" "隋棠"   "蔡依林"
x3[["name"]]
## [1] "林志玲" "隋棠"   "蔡依林"

names(x3)
## [1] "name"   "height" "model"

names(x3) <- c("Name", "Height", "Model")
names(x3)
## [1] "Name" "Height" "Model"





# 移除物件rm()
# 利用rm()清除變數、物件等
a <- c(1,2,3) # 這時Environment區域會出現a物件
rm(a) # 如此就可清除a變數

# 利用ls()，可以得知目前Environment的所有變數
ls()
rm(list = ls()) # 可以清空Environment











# ch03 --------------------------------------------------------------------
#	class可以檢視資料型態(資料結構)
#	str總覽資料，可以檢視資料結構中的數據型態
#	is.XXX系列可以確認各種資料結構





# Ch03型態轉換 ----------------------------------------------------------------
(num <- 1:5)
## [1] 1 2 3 4 5

as.character(num)
## [1] "1" "2" "3" "4" "5"

temp2 <- factor(c("低溫", "舒適", "高溫", "低溫", "舒適", "高溫"))
temp2
## [1] 低溫 舒適 高溫 低溫 舒適 高溫
## Levels: 低溫 高溫 舒適

as.numeric(temp2)
## [1] 1 3 2 1 3 2






# Ch03基本統計函數 ----------------------------------------------------------------
num <- c(1:3, 5:7)
num
## [1] 1 2 3 5 6 7

min(num)
## [1] 1

max(num)
## [1] 7

sum(num)
## [1] 24

var(num)
## [1] 5.6

sd(num)
## [1] 2.366432

round(x = sd(num), digits = 2)
## [1] 2.37






# Ch03常用函數二table、prop.table ----------------------------------------------------------------
dayoff <- c("星期一", "星期三", "星期四", "星期五", "星期二",
            "星期二", "星期三", "星期一", "星期一", "星期五")
table(dayoff)
## 星期一 星期二 星期三 星期五 星期四 
##      3      2      2      2      1

prop.table(table(dayoff))
## 星期一 星期二 星期三 星期五 星期四 
##    0.3    0.2    0.2    0.2    0.1







# Ch04使用R整理數據 --------------------------------------------------------------------
data("iris")
head(iris) # 列出前幾筆資料, 預設6筆
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa

dim(iris)  # 列出資料表的 rows and columns 數量
## [1] 150   5



# Ch04表格的取值─座標 --------------------------------------------------------
iris[2, 3]
## [1] 1.4

iris[1:6, 1:3]
##   Sepal.Length Sepal.Width Petal.Length
## 1          5.1         3.5          1.4
## 2          4.9         3.0          1.4
## 3          4.7         3.2          1.3
## 4          4.6         3.1          1.5
## 5          5.0         3.6          1.4
## 6          5.4         3.9          1.7







# Ch04表格的取值─列、欄 --------------------------------------------------------
iris[2, ]
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 2          4.9           3          1.4         0.2  setosa

iris[c(1, 51, 101),]
## Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
## 1            5.1         3.5          1.4         0.2     setosa
## 51           7.0         3.2          4.7         1.4 versicolor
## 101          6.3         3.3          6.0         2.5  virginica






# 選取整欄資料(column)時，有三種常用方法
iris[,1] # 欄位名稱未知
iris$Sepal.Length # 已知欄位名稱
iris[["Sepal.Length"]] # 已知欄位名稱 
## [1] 5.1 4.9 4.7 4.6 5.0 5.4 4.6 5.0 4.4 4.9 5.4 4.8 4.8 4.3 5.8 5.7 5.4
## [18] 5.1 5.7 5.1 5.4 5.1 4.6 5.1 4.8 5.0 5.0 5.2 5.2 4.7 4.8 5.4 5.2 5.5
## [35] 4.9 5.0 5.5 4.9 4.4 5.1 5.0 4.5 4.4 5.0 5.1 4.8 5.1 4.6 5.3 5.0 7.0
## [52] 6.4 6.9 5.5 6.5 5.7 6.3 4.9 6.6 5.2 5.0 5.9 6.0 6.1 5.6 6.7 5.6 5.8
## [69] 6.2 5.6 5.9 6.1 6.3 6.1 6.4 6.6 6.8 6.7 6.0 5.7 5.5 5.5 5.8 6.0 5.4
## [86] 6.0 6.7 6.3 5.6 5.5 5.5 6.1 5.8 5.0 5.6 5.7 5.7 6.2 5.1 5.7 6.3 5.8
## [103] 7.1 6.3 6.5 7.6 4.9 7.3 6.7 7.2 6.5 6.4 6.8 5.7 5.8 6.4 6.5 7.7 7.7
## [120] 6.0 6.9 5.6 7.7 6.3 6.7 7.2 6.2 6.1 6.4 7.2 7.4 7.9 6.4 6.3 6.1 7.7
## [137] 6.3 6.4 6.0 6.9 6.7 6.9 5.8 6.8 6.7 6.7 6.3 6.5 6.2 5.9






# Ch04表格的取值─條件篩選 ----------------------------------------------------------
iris[iris$Sepal.Length > 5.5 & iris$Species=="setosa", ]
##    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 15          5.8         4.0          1.2         0.2  setosa
## 16          5.7         4.4          1.5         0.4  setosa
## 19          5.7         3.8          1.7         0.3  setosa

aim <- iris[iris$Sepal.Length > 4.5, "Species"]
table(aim)
## setosa versicolor  virginica 
## 45         50         50







# Ch05 R語言做文字處理(基礎) --------------------------------------------------------


# Ch05 字串處理paste、nchar、substring、strsplit --------------------------------------------------------
# 1.	字串的連接paste
a <- "year"
b <- "2018"
paste(a, b, sep = ":")
## [1] "year:2018"

# 即使不是字串，連接完之後也會變成字串
c <- "date"
d <- 20181119
paste(c, d, sep = ":")
## [1] "date:20181119"



# 2.計算字串長度nchar
word <- c("R語言集訓班")
nchar(word) # 試著與 length 函數比較
## [1] 6

length(word) # 這是在計算向量的長度
## [1] 1





# 3.截取子字串substring
word <- c("R語言集訓班")
substring(text = word, first = 1, last = 3)
## [1] "R語言"





# 4.字串的切割strsplit
test <- c("language")
strsplit(x = test, split = "a")
## [[1]]
## [1] "l"   "ngu" "ge"







# Ch05 關鍵字的取代與找查gsub、grep、grepl、gregexpr ----------------------------------


# 1.關鍵字的取代gsub
# gsub(pattern, replacement, x)
year <- c("民國99", "民國100", "民國101")
gsub("民國", "", year)
## [1] "99"  "100" "101"

# 加上1911，轉換成西元
as.numeric(gsub("民國", "", year)) + 1911
## [1] 2010 2011 2012





# 2.關鍵字的找查grep、grepl
# grep(pattern, x, value=TRUE)
# grepl(pattern, x)
title <- c("馬習會前交涉祕辛曝光", "馬說明馬習會：公布逐字稿不可思議的透明", "談22K政策朱立倫：不幸被企業濫用")
grep("馬習會", title)
## [1] 1 2

grepl("馬習會", title)
## [1]  TRUE  TRUE FALSE

grep("馬習會", title, value = TRUE)
## [1] "馬習會前交涉祕辛曝光"                  
## [2] "馬說明馬習會：公布逐字稿不可思議的透明"




# 3.關鍵字的找查gregexpr
txt <- c("名模林志玲身高有174公分，體重52公斤", "女神蔡依林身高158公分，體重只有39公斤")
matches <- gregexpr("[0-9]+", txt)
regmatches(txt, matches)
## [[1]]
## [1] "174" "52" 
## 
## [[2]]
## [1] "158" "39"






# Ch06 套件安裝 ---------------------------------------------------------------
# 使用方法
# install.packages("套件名稱")


# 1.套件來自官方社群
# 安裝套件praise
install.packages("praise")



# 2.套件來自非官方社群，如GitHub
# 使用方法
# 先安裝一個叫"devtools"的套件，並載入
# 再利用套件中的install_github()函式做安裝
# install_github("GitHub帳號/套件名稱")

# 安裝套件praise 
install.packages(devtools) # 下載devtools套件
library(devtools) # 載入devtools套件
install_github("cran/praise") #從GitHub下載cran帳號開發的praise套件





# Ch06 載入套件 ---------------------------------------------------------------
# 載入套件praise
# 記得要先下載套件唷！
library(praise)








# Ch06 第一次使用套件 ---------------------------------------------------------------
# 使用？、？？或是help()做查詢
# 或是在右下角「系統檔案區」的「Help」子標籤下，輸入想搜尋的套件
?praise
??praise
help("praise")

# 使用praise套件的praise()函式
praise()
## [1] "You are stunning!"

# 瀏覽自己電腦中套件的說明文件
browseVignettes()









# Ch07 資料讀取與匯出 ------------------------------------------------------------
# 取得目前工作目錄
getwd()
## [1] "C:/Users/littlefish/Documents" # 這是講師目前的R語言的工作目錄

# 更改工作目錄到D槽
# 並確認是否工作目錄切換到D槽之week01資料夾之下
setwd("D:/week01")
getwd()
## [1] "D:/week01"





# 讀取csv檔，並存進變數pokedata中
# read.csv("檔案路徑")
pokedata <- read.csv("D:/week01/Pokemon_data/Pokemon.csv")




# 利用編碼UTF-8讀取資料
pokedata <- read.csv("D:/week01/Pokemon_data/Pokemon.csv",
                     fileEncoding = "UTF-8")

# 不讓第一列(first row)做為標題列。(預設為TRUE)
pokedata <- read.csv("D:/week01/Pokemon_data/Pokemon.csv",
                     header = FALSE)

# 使用","作為分隔字元。(預設為",")
pokedata <- read.csv("D:/week01/Pokemon_data/Pokemon.csv", sep = ",")


# 利用欄位Type.1篩選出火系(Fire)神奇寶貝。注意篩選是用兩個等號「==」
# 將篩選出的變數，存放到變數poke_fire中
poke_fire <- pokedata[pokedata$Type.1=="Fire", ]



# 儲存poke_fire為csv檔
# write.csv("資料集變數", "儲存路徑(函檔案名稱)")
write.csv(x = poke_fire, file = "D:/week01/Pokemon_data/Pokemon_fire.csv")




# 儲存poke_fire為csv檔
write.csv("資料集變數", "儲存路徑(函檔案名稱)")
write.csv(x = poke_fire, file = "D:/week01/Pokemon_data/Pokemon_fire.csv",
          row.names = FALSE)



# 儲存poke_fire為csv檔
write.csv("資料集變數", "儲存路徑(函檔案名稱)")
write.csv(x = poke_fire, file = "D:/week01/Pokemon_data/Pokemon_fire.csv",
          fileEncoding = "UTF-8")











