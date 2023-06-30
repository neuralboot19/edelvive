require "test_helper"

class PersonaTest < ActiveSupport::TestCase
  fixtures :personas

  setup do
    @persona = personas(:persona1)
  end

  test 'should be valid' do
    assert @persona.valid?
  end

  test 'should require nombre' do
    assert_not @persona.nombre.valid?
    assert_includes @persona.errors[:nombre], "can't be blank"
  end

  test 'should require fecha_nacimiento' do
    assert_not @persona.fecha_nacimiento.valid?
    assert_includes @persona.errors[:fecha_nacimiento], "can't be blank"
  end
end
