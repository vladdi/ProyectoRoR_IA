class PrincipalController < ApplicationController
  def index

  @pregunta_soporte = params[:pregunta_usuario_soporte]

  @pregunta_producto = params[:pregunta_usuario_producto]


    @pregunta_vector = @pregunta_soporte.to_s.split(" ")

    @palabras_comercial = ["office","compra","venta","licencia","activacion","programa","programas","comprar","vender","activar"]
    @palabras_tecnico = ["reparacion","descompuso","prende","prender","quemo","laptop","lap","mojo","apago","reparar","garantia"]

    @comercial = Jaccard.coefficient(@pregunta_vector, @palabras_comercial)
    @tecnico = Jaccard.coefficient(@pregunta_vector, @palabras_tecnico)

    @soporte_comercial = "SOPORTE COMERCIAL lo atendera"
    @soporte_tecnico = "SOPORTE TECNICO lo atendera"


	end

end
