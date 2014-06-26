class PrincipalController < ApplicationController
  def index

  @pregunta_soporte = params[:pregunta_usuario_soporte]
  

  @pregunta_vector = @pregunta_soporte.to_s.split(" ")

  @palabras_comercial = ["office","compra","venta","licencia","activacion","programa","programas","comprar","vender","activar","adquirir","anuncio","anunciar"]
  @palabras_tecnico = ["reparacion","descompuso","prende","prender","quemo","laptop","lap","mojo","apago","reparar","garantia","computadora","cable"]

  @comercial = Jaccard.coefficient(@pregunta_vector, @palabras_comercial)
  @tecnico = Jaccard.coefficient(@pregunta_vector, @palabras_tecnico)

  @soporte_comercial = "SOPORTE COMERCIAL lo atendera"
  @soporte_tecnico = "SOPORTE TECNICO lo atendera"

	end

  private
  # ALMACENER EN BD 
  
    #@nombre_producto = params[:nombre_producto]
    #@tags_producto = params[:tags_producto]
    #@crear_producto = Principal.create({name: @nombre_producto, tags_: @tags_producto})
  
  def create
    @principal = Principal.new(principal_params)

    @principal.save
    redirect_to @principal
  end

  private
  def principal_params
    params.require(:principal).permit(:name,:tags_)
  end

  
end
