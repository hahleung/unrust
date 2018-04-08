require 'pry'

class PolynomialReducer
  Term = Struct.new(:operator, :instance, :member) do
    def tidy_member
      Term.new(operator, instance, member.chars.sort.join)
    end

    def clear_operator
      Term.new("", instance, member)
    end

    def update_instance(is_positive, new_instance)
      Term.new(is_positive ? "+" : "-", new_instance, member)
    end

    def assemble
      case instance
      when "1"
        [operator, "", member].join
      else
        [operator, instance, member].join
      end
    end
  end

  def self.simplify(polynome)
    terms = polynome.split(/(?=[+-])/)

    simplified_terms = sanitize_first_group(terms)
      .map { |term| term.match?(/[0-9]/) ? term : term.insert(1, "1") }
      .map { |term| term.scan(/\d+|\D+/) }
      .map { |operator, instance, member| Term.new(operator, instance, member).tidy_member }
      .reduce([]) { |terms, term| simplify_members(terms, term) }
      .sort_by { |term| [term.member.length, term.member] }

    sanitize_first_term(simplified_terms).map { |term| term.assemble }.join
  end

  def self.sanitize_first_group(terms)
    first_term = terms.first.chars.first.match?(/([+-])/) ? terms.first : "+" + terms.first
    [first_term] + terms.drop(1)
  end

  def self.simplify_members(terms, current_term)
    polynome_term = terms.detect { |term| term.member == current_term.member }
    updated_term = polynome_term ? get_updated_term(polynome_term, current_term) : current_term
    terms.reject { |term| term.member == current_term.member } << updated_term
  end

  def self.get_updated_term(polynome_term, current_term)
    instance = [polynome_term, current_term].reduce(0) do |instance, term|
      term_instance = term.instance.to_i
      term.operator == "+" ? instance + term_instance : instance - term_instance
    end
    polynome_term.update_instance(instance > 0, instance.abs.to_s)
  end

  def self.sanitize_first_term(reduced_terms)
    terms = reduced_terms.reject {|x| x.instance == "0"}
    first_term = terms.first.operator == "+" ? terms.first.clear_operator  : terms.first
    [first_term] + terms.drop(1)
  end
end

# Other responses:
# def simplify(poly)
#   poly.scan(/([\+-]*\d*)([a-z]+)/).map do |i|
#     str = i[1].split("").sort.join
#     i[0] =~ /^[\+-]$/ || i[0].empty? ? [(i[0]+"1").to_i, str] : [i[0].to_i, str]
#   end.inject(Hash.new(0)) do |h, arr|
#     h[arr[1]] += arr[0]
#     h
#   end.sort_by { |(k, v)| [k.length, k] }.select { |i| i[1] != 0 }
#   .map { |i| i[1].to_s + i[0] }.join("+")
#   .gsub(/([\+-])1([a-z])/,'\1\2').gsub(/\+-/, "-").gsub(/^1([a-z].*)$/, '\1')
# end
