# Pareto graph
library(ggplot2)
library(readxl)
setwd("D:/Documentos/proyectos/fondo retiro")
pareto <- read_excel("paretograf.xlsx") # debe ser en formato "libro de excel"
z=as.matrix(pareto)
tamano=dim(z)
intervalos=seq(1,tamano[2],2)
datostot=data.frame()
for (i in intervalos) {
  # Generar datos de ejemplo (en este caso, una secuencia de números)
  datos <- data.frame(x = z[1:15,i], y =z[24:38,i],SavingYears = paste0("", i+20))
  # Agregar los datos a la lista
  datostot <- rbind(datostot,datos)
 
}

  
# Crear el gráfico con ggplot

      
grafico= ggplot(datostot, aes(x = x, y = y, color = SavingYears)) + geom_line() +
   labs(title = "", x = "Coverage in years", y = "Aportation rate") + # Título y etiquetas de los ejes
  scale_x_continuous(breaks = seq(10, 45, by = 2), 
                     labels =seq(10, 45, by = 2) ) +  # Marcas y etiquetas en el eje x
  scale_y_continuous(breaks = c(.21,seq(.2, .35, by = .02),.35)) + # Marcas en el eje y
  
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
 


# Mostrar el gráfico
d1=print(grafico+ 
  theme(legend.position = c(.9,.4),legend.title = element_text(colour="red",
  face="bold", size=8)))  # Ubicación de la leyenda

ggsave("pareto2.png",plot=d1,path= "D:/Documentos/proyectos/fondo retiro")

