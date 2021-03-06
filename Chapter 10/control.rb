class Control
  def self.build(options={})
    control = self.new
    options.each do |k,v|
      if v.is_a?(Proc)
        control.send(k) { v.call }
      else
        control.send("#{k}=",v)
      end
    end
    control
  end

  def <<(control)
    controls.add(control)
    self
  end
end

