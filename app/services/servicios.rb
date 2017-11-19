module Servicios
  require 'digest/md5'
  def self.TraerValorParametro(params)
    unless params.nil?
      ValorParametro.find(params).valor
    end
  end

  def TraerParametros(params)
    unless params.nil?
      ValorParametro.where(["parametroId ='#{params}'"]).select(:valor,:id)
    end
  end

  def self.TraerOpcionesParametros(params)
    p "PARAMS"
    p params

    unless params.nil?
      parametros = Parametro.where(atributo: params)
      p "PARAMETROS"
      p parametros
      unless parametros.blank?
        parametroId = parametros.first.id
        p "PAID"
        p parametroId

        p ValorParametro.where(parametro_id: parametroId).select(:valor, :id)

        ValorParametro.where(parametro_id: parametroId).select(:valor, :id)
      end
    end
  end

  def Encriptar(params)
    unless params.nil?
      res = Digest::MD5.hexdigest(params)
      return res
    end
  end
end
