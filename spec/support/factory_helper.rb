module FactoryHelper
  def model_build
    described_class.to_s.underscore.tr('/', '_').to_sym
  end

  def model
    @model ||= build model_build
  end
end
