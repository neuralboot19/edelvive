require "test_helper"

class Api::ComunicadosControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_comunicados_url
    assert_response :success

    response_body = JSON.parse(response.body)
    assert_includes response_body, 'comunicados'
    assert_includes response_body, 'numero_adjuntos'

    comunicados = response_body['comunicados']
    assert_instance_of Array, comunicados

    comunicados.each do |comunicado|
      assert_includes comunicado, 'id'
      assert_includes comunicado, 'creador_id'
      assert_includes comunicado, 'receptor_id'
      assert_includes comunicado, 'asunto'
      assert_includes comunicado, 'contenido'
      assert_includes comunicado, 'comunicado_anterior_id'
      assert_includes comunicado, 'adjuntos'
      assert_instance_of Array, comunicado['adjuntos']
    end

    numero_adjuntos = response_body['numero_adjuntos']
    assert_instance_of Integer, numero_adjuntos
  end
end
