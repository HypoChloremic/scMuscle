cl12 = read.csv('170620_musc_12osat.csv')
cl3 = read.csv('170620_musc_3osat.csv')
combined = rbind(cl3[, 2:3], cl12[, 2:3])

plot(cl3$X0, cl3$X1)
plot(cl12$X0, cl12$X1)

#################
### Cluster 3 ###
fit = princurve::principal_curve(as.matrix(cl3[,2:5]))
plot(cl3[,2:3])
lines(fit, lwd=10, col='red')




# Saving the curve and order
line_coord = as.data.frame(fit[c('s', 'ord')])
cl3_fitted = cbind(line_coord, cl3)
write.csv(cl3_fitted, 'princurve_cl3_v220422.csv')

#################
### Cluster 12 ###

fit = princurve::principal_curve(as.matrix(cl12[,2:5]))
points(cl12[c('X0', 'X1')])
lines(fit, col='red', lwd=10)


# Saving the curve and order
line_coord = as.data.frame(fit[c('s', 'ord')])
cl12_fitted = cbind(line_coord, cl12)
write.csv(cl12_fitted, 'princurve_cl12_v220422.csv')


###### Combined plot
# flipping the x-axis
cl3[, 2] = cl3[, 2] * -1

# running the princurve
fit1 = princurve::principal_curve(as.matrix(cl3[,2:5]))
fit2 = princurve::principal_curve(as.matrix(cl12[,2:5]))

# Plotting the princurve
lines(fit1, lwd=10, col='red')
lines(fit2, col='red', lwd=10)

plot(combined[, 1] * -1, combined[, 2])
