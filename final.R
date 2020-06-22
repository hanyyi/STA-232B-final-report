library(lars)
data(diabetes)
head(diabetes)
diabe = diabetes
diabe$x2 = diabetes$x2[,-11]

x = diabe$x
y = diabe$y
lasso1 = lars(x,y,type="lasso")
lar1 = lars(x,y,type="lar",intercept = F)
stage1 = lars(x,y,type="forward.stagewise") 
step1 = lars(x,y,type="stepwise")
par(mfrow=c(2,2))
plot(lasso1)
plot(lar1)
plot(stage1)
plot(step1)

x2 = diabe$x2
lars2 = lars(x,y,type="lar")
beta = coef.lars(lar1)
mu = diabe$x %*% beta[10,]
epsilon = diabe$y - mu
real_R =(t(mu) %*% mu)/(t(mu) %*% mu + t(epsilon)%*%epsilon)

sample(epsilon,100,replace = T)
k = 40
for (i in 1:k) {
  beta2 = coef(lars2)
  mu_temp = diabe$x2 %*% beta2[k+1,]
  epsilon_temp = diabe$y - mu_temp
  pe_temp = 1 - 
}


cvsol1<-cv.lars(x,y,type="lar",mode="step")
cvsol1$index[which.min(cvsol1$cv)]





