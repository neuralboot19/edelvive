class HomeController < ApplicationController
  def index
    array = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l']
    num_subdivisiones = 3
    longitud = array.length
    elementos_por_subdivision = longitud / num_subdivisiones
    resto = longitud % num_subdivisiones
  
    @resultado = []
    indice = 0
  
    num_subdivisiones.times do |i|
      elementos = elementos_por_subdivision
      elementos += 1 if i < resto
  
      subdivision = []
  
      elementos.times do
        subdivision << array[indice]
        indice += 1
      end
  
      @resultado << subdivision
    end
  
    @resultado
  end
end
