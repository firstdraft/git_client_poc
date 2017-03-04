module ApplicationHelper
  def javascript_branch_name(name)
    if valid_variable_name?(name)
      name
    elsif name.to_i.to_s == name
      name.to_i.humanize
    elsif name.to_f.to_s == name
      name.to_f.humanize
    else
      name.to_f.humanize + " " + SecureRandom.hex(6)
    end
  end

  def valid_variable_name?(var_name)
    Object.new.local_variable_set (var_name).to_sym, nil
    true
  rescue NameError
    false
  end
end
