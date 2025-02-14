
# 作業ディレクトリを取得または指定
wd <- getwd()

# ファイルを読み込む
file_path <- paste(wd, "/chap9sample1.csv", sep = "")
x <- read.csv(file_path)
# (wd <- getwd())

x1 <- x[,-1]
x1
# 相関行列の固有値を算出している
e <- eigen(cor(x1))
e$value

#cumsumで累積和をしている
cumsum(e$value) /sum(e$value) * 100

# 今回はガットマン基準で因子数を設定
plot(e$value , type = "b")
abline(h = 1, col = "red", lty = 2)  # 赤い破線

library(psych)
fa.out <- fa(x1, nfactors  = 2 ,rotate =  "varimax", fm = "pa")
print(fa.out, digits = 3, sort = T )

fa.diagram( fa.out )


