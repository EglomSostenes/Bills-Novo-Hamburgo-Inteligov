# frozen_string_literal: true

class BillsNovoHamburgoScrapper 
  
  URL = "https://sapl.camaranh.rs.gov.br/materia/pesquisar-materia?tipo=1&ementa=&numero=&numeracao__numero_materia=&numero_protocolo=&ano=&o=&tipo_listagem=1&data_apresentacao_0=&data_apresentacao_1=&data_publicacao_0=&data_publicacao_1=&autoria__autor=&autoria__primeiro_autor=1&autoria__autor__tipo=&autoria__autor__parlamentar_set__filiacao__partido=&relatoria__parlamentar_id=&local_origem_externa=&tramitacao__unidade_tramitacao_destino=&tramitacao__status=&em_tramitacao=&materiaassunto__assunto=&indexacao="

  def initialize
    @mechanized = Mechanize.new
    @scrap_bills = Array.new
  end

  def self.extract_bills
    new.extract_with_pagination
  end

  def extract_with_pagination
    loop do
      @page = @mechanized.get(current_uri || URL)
      @html = Nokogiri::HTML(page.body)
      get_bills_current_page
      break if end_page?
    end

    scrap_bills
  end

  def count_entries
    page = @mechanized.get(URL)
    html = Nokogiri::HTML(page.body)
    html.xpath('//div[@class="container-detail clearfix"]//h3').text.scan(/\d+/).first.to_i
  end

  private

  attr_reader :page, :mechanized, :html, :current_uri, :scrap_bills

  def end_page?
    next_page = pagination.last
    next_page_value = next_page.xpath('./a')

    @current_uri = mechanized.resolve(next_page_value.first["href"])

    next_page.classes.include? "disabled"
  end

  def pagination
    html.xpath('//ul[contains(@class, "pagination")]/li')
  end

  def get_bills_current_page
    html.xpath('//table/tr/td').each do |item|
      a = item.xpath('./strong/a').first
      link = mechanized.resolve(a.attributes["href"].value)

      current_status = ""

      item.xpath('./strong').each do |bold|
        if bold.to_s.include?("Status")
          current_status = bold.next_sibling.text.gsub(/[[:space:]]/, ' ').strip
          break
        end
      end

      bill_scrap = {
        name: a.content.split('-').first.strip,
        link: link.to_s,
        abstract: item.xpath('./div[@class="dont-break-out"]').text,
        status: current_status
      }

      scrap_bills.push(bill_scrap)
    end
  end
end
