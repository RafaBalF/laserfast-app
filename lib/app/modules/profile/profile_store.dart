import 'package:laserfast_app/app/models/auth.model.dart';
import 'package:laserfast_app/app/models/dados_pessoais.model.dart';
import 'package:laserfast_app/app/models/hives/login.hive.dart';
import 'package:mobx/mobx.dart';
import 'package:laserfast_app/loading_store.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  final LoadingStore loadingStore = LoadingStore();
  final LoginHive _loginHive = LoginHive();

  //==============================================
  //==== PROFILE =================================
  //==============================================

  @action
  Future<void> initProfile() async {}

  @action
  void resetProfile() {}

  //==============================================
  //==== DADOS-PESSOAIS ==========================
  //==============================================

  @observable
  DadosPessoaisModel? dadosPessoaisModel;

  @action
  Future<void> initDadosPessoais() async {
    AuthModel auth = _loginHive.getLogin();

    dadosPessoaisModel = DadosPessoaisModel(
      nome: auth.name ?? 'Leonardo Polo',
      email: auth.email ?? 'leonardo.polo@gmail.com',
      celular: auth.celular ?? '17998982144',
      cpf: auth.cpf ?? '33365500000',
    );
  }

  @action
  void resetDadosPessoais() {}

  //==============================================
  //==== ENDERECOS ===============================
  //==============================================

  @action
  Future<void> initEnderecos() async {}

  @action
  void resetEnderecos() {}

  //==============================================
  //==== CONFIGURAÇÕES ===========================
  //==============================================

  @action
  Future<void> initConfiguracoes() async {}

  @action
  Future<void> logout() async {
    await _loginHive.logout();
  }

  @action
  Future<void> deleteAccount() async {
    await _loginHive.logout();
  }

  @action
  void resetConfiguracoes() {}

  //==============================================
  //==== ENDERECOS ===============================
  //==============================================

  @observable
  String politicaDePrivacidade = '';

  @action
  Future<void> initPoliticasDePrivacidade() async {
    politicaDePrivacidade = """Política de Privacidade
Esta Política de Privacidade foi elaborada em conformidade a Lei Federal 12.965/2014 (Marco Civil da Internet) e com a Lei Federal 13.709/2018 (Lei Geral de Proteção de Dados Pessoais).
LASER FAST DEPILAÇÃO LTDA., pessoa jurídica de direito privado, devidamente inscrita no CNPJ sob o nº 31.237.773/0001-10, com endereço na Avenida Francisco das Chagas Oliveira, 1230, Anexo XVIII, Chácara Municipal, CEP: 15090-190, São José do Rio Preto -SP, doravante designada simplesmente “LASER FAST’

1. Informações gerais
Este Termo de Uso e Política de Privacidade é exclusiva para esta Plataforma LASER FAST (Site e App) e contém informações sobre o modo que a LASER FAST (“Controladora”) trata os dados dos usuários (“Titular”) que acessam esta Plataforma LASER FAST (Site e App), comprometendo-se a resguardar a sua privacidade.
Este Termo poderá ser modificado a qualquer momento pela LASER FAST em virtude de alterações na legislação ou nos Serviços, em decorrência da utilização de novas ferramentas tecnológicas ou, ainda, sempre que, a exclusivo critério da LASER FAST, tais alterações se façam necessárias. A utilização dos Serviços online disponibilizados pela LASER FAST por qualquer usuário implicará em expressa aceitação destes Termos e Condições de Uso.
Não se aplica esta Política de Privacidade a “banners”, sorteios, outros anúncios ou promoções que a LASER FAST possa exibir, patrocinar ou participar em sites ou App de terceiros, nem a outras formas de coletas de dados, seja por meio por outros sites ou de outras plataformas.
Esta Política de Privacidade poderá ser atualizada em decorrência de eventuais modificações normativas, razão pela qual recomendamos que visite periodicamente esta página para que você tenha conhecimento de suas modificações.
Alertamos que se você não concordar com o conteúdo desta política, não é recomendável cadastrar os dados, baixar nossos materiais e, ainda, se não esteja de acordo com as condições aqui estabelecidas, interrompa imediatamente o uso desta Plataforma LASER FAST (Site e App), pois, ao navegar por ele e fornecer informações pessoais, estará concordando com a coleta, o processamento e com o uso das informações pessoas da maneira descrita por esta Política de Privacidade.

2. Conteúdo Restrito e Suspensão de Acesso
Alguns Serviços estão disponíveis em conteúdo fechado (App e E-commerce). Quando o acesso a conteúdo for restrito, será necessário prévio cadastro do usuário e o acesso ao ambiente por meio de login e senha.
Considerando que, o usuário é responsável pela veracidade das informações cadastradas, esclarece-se, desde já, que o cadastro de informações falsas pode gerar inconsistência na prestação dos Serviços, bem como impactar ou interromper o seu acesso.
Verificada qualquer irregularidade cadastral ou violação das políticas da LASER FAST, a qualquer tempo, sem aviso prévio, a LASER FAST poderá suspender, cancelar ou interromper o acesso aos Serviços, respeitadas as condições da legislação aplicável.
A LASER FAST não se responsabiliza por eventuais danos e/ou problemas decorrentes da demora, interrupção ou bloqueio nas transmissões de dados decorrentes da conexão de internet do usuário.

3. Uso Adequado dos Serviços prestados pela LASER FAST
A utilização dos serviços prestados pela LASER FAST, norteia-se pelo compromisso do usuário em respeitar a legislação brasileira vigente e o disposto nesta política e nos Termos e Condições de Uso, não devendo produzir, disponibilizar ou compartilhar qualquer conteúdo que implique a prática de ato ilícito e viole a legislação brasileira vigente; viole direitos de terceiro ou direitos da LASER FAST; seja falso, incorreto, impreciso, extemporâneo e que possa induzir outrem a erro; disponibilize ou permita o acesso a conteúdo ilegal, violento, pornográfico ou qualquer outro ato contrário à lei e à ordem pública; induza a discriminação ou incite o ódio contra pessoas e/ou grupos de pessoas em razão de nacionalidade, raça, religião, orientação sexual, gênero, condição física, nacionalidade, dentre outros atos que contrariem a ordem pública e a legislação brasileira vigente; seja resguardado por direito de propriedade intelectual de terceiro e você não tenha autorização prévia para utilizá-lo; contenha vírus ou outro elemento que seja capaz, em razão de suas características (como forma, extensão, etc), de causar danos ou impedir o funcionamento regular da rede do sistema e/ou de equipamentos informáticos ("hardware" e "software") da LASER FAST ou de terceiro.

4. Coleta de Dados
As informações coletadas nesta Plataforma LASER FAST (Site e App) podem ocorrer das seguintes formas:
A- Identificação Pessoal – são fornecidas pelo usuário, tais como, nome, telefone, email, empresa em que trabalha e cargo – via preenchimento dos formulários para download de nossos conteúdos gratuitos. Eventualmente, as solicitações de algumas informações podem ser feitas por meio de contato direto da LASER FAST com os usuários via e-mail ou telefone.
As informações pessoais somente serão coletadas se forem fornecidas voluntariamente pelos usuários da Plataforma LASER FAST (Site e App), pois, quando estas informações são fornecidas, significa que há uma autorização para que sejam usadas, de acordo com os termos desta Política de Privacidade. Caso o usuário decida não fornecer as Informações Pessoais, advertimos que poderá encontrar algumas restrições de acesso à Plataforma LASER FAST (Site e App).
Dependendo da ação realizada, ao se cadastrar, navegar, adquirir ou solicitar produtos e/ou serviços do LASER FAST, serão requisitadas informações sobre: identificação individual do cliente; itens de interesse de aquisição e forma de pagamento do produto ou serviço solicitado no Portal; preferências do cliente; opiniões do internauta; acesso do internauta (exemplo: data e horário de realização do acesso); e perfil de acesso do internauta (exemplo: links clicados, páginas visitadas).
B- Informações de navegação na Plataforma LASER FAST (Site ou App) – Quando você visita a Plataforma LASER FAST (Site e App) é inserido um ‘cookie’ no seu navegador por meio do software Google Analytics para identificar quantas vezes você retorna ao nosso endereço. São coletadas, anonimamente, informações, como endereço IP, localização geográfica, fonte de referência, tipo de navegador, duração da visita e páginas visitadas.
Todas as informações de navegação, coletadas de forma automatizada e posteriormente vinculadas as informações de identificação pessoal fornecidas pelo usuário, serão tratadas como Informações de identificação pessoal para os fins dessa política de privacidade.
Os Cookies são utilizados para melhor experiência do usuário no portal, sendo eles pequenos arquivos gravados no dispositivo de acesso de usuário, enquanto este navega na internet, são armazenados em seu navegador e ajudam a armazenar suas preferências e a personalizar seu acesso.
Assim, pode-se usar cookies e coletar, tratar, armazenar e/ou compartilhar (com as empresas pertencentes ao mesmo grupo econômico da LASER FAST ou parceiros) informações de sua navegação, para: permitir que a navegação seja mais eficiente e rápida; aperfeiçoar sua usabilidade, experiência e interatividade na utilização do portal, aplicativos, e-mails e durante a sua navegação na internet; fazer ofertas e/ou te dar informações mais assertivas e relevantes às suas necessidades e interesses; buscar maior eficiência em relação à frequência e continuidade da nossa comunicação com o usuário; responder suas dúvidas e solicitações; realizar pesquisas de comunicação e marketing de relacionamento, para melhorar os produtos e serviços oferecidos, bem como apuração de estatísticas em geral.
Neste caso, é possível ao usuário a qualquer momento ativar em seu navegador mecanismos para informá-lo quando os cookies estiverem acionados ou, ainda, impedir que sejam ativados, podendo optar por desativar os cookies não-essenciais para a utilização dos Serviços através das preferências do seu navegador.
Vale ressaltar que, sem eles a navegação pode se tornar limitada e algumas funcionalidades dos sites e Apps podem ficar comprometidas.
C- Histórico de contato – A LASER FAST faz a armazenagem de informações que dizem respeito aos contatos já realizados pelos usuários, como conteúdos baixados a partir de nossas páginas e interações via e-mail, telefone, SMS, WhatsApp promocional, Push através do aplicativo da LASER FAST.

5. Uso das Informações Pessoais
Este termo permite que a LASER FAST use as informações pessoais para diferentes finalidades.
a) e-mail: é utilizado para envio do material, envio de Newsletters, informação e lançamento de produtos, cursos e webinars, dentre outras comunicações, sempre relacionadas ao negócio da LASER FAST e parceiros.
b) dados de download: poderão ser divulgados como pesquisas e estatísticas, não sendo reveladas abertamente nenhuma informação pessoal, a menos que autorizada explicitamente.
Poderão ser feitas abordagens por e-mail, telefone, SMS, WhatsApp promocional, Push através do aplicativo da LASER FAST, para realização de pesquisas ou para apresentação de produtos e serviços, oportunidade que estes dados serão considerados anonimizados.
Suas informações pessoais serão compartilhadas com nossos parceiros apenas quando a parceria estiver relacionada às nossas atividades.

6. Acesso às Informações Pessoais
As informações pessoais fornecidas pelos usuários poderão ser acessadas por colaboradores da LASER FAST e funcionários de empresas contratadas pela LASER FAST para realização de ações de marketing. Eventualmente, caso as inserções de informações do usuário se dê em ações criadas em parcerias, os parceiros explicitamente identificados também terão acesso à informação. Nenhuma informação pessoal poderá ser divulgada publicamente.
A LASER FAST também se compromete a não vender, alugar ou repassar suas informações para terceiros. A única exceção está nos casos em que essas informações forem exigidas judicialmente.
Além disso, embora trabalhemos com boas práticas de proteção e segurança, nenhum serviço web possui 100% de garantia contra invasões e não podemos nos responsabilizar caso isso ocorra.

7. Compartilhamento de Informações nas Redes Sociais
Ao clicar nos botões de compartilhamento de conteúdo nas mídias sociais disponíveis em nossas páginas, o usuário estará publicando o conteúdo por meio de seu perfil na rede selecionada. A LASER FAST não tem acesso ao login e senha dos usuários nessas redes, nem publicará conteúdo em nome do usuário sem que ele realize esta ação.
A LASER FAST fica autorizado a compartilhar os dados pessoais do usuário com outros agentes de tratamento de dados, caso seja necessário para as finalidades listadas neste instrumento, desde que, sejam respeitados os princípios da boa-fé, finalidade, adequação, necessidade, livre acesso, qualidade dos dados, transparência, segurança, prevenção, não discriminação e responsabilização e prestação de contas.
A LASER FAST se responsabiliza por manter medidas de segurança, técnicas e administrativas suficientes a proteger os dados pessoais do usuário e à Autoridade Nacional de Proteção de Dados (ANPD), comunicando ao usuário caso ocorra algum incidente de segurança que possa acarretar risco ou dano relevante, conforme artigo 48 da Lei Federal nº 13.709/2020.

8. Cancelamento e Remoção de Informações Pessoais de Comunicados da LASER FAST
O Usuário poderá optar por não receber promoções da LASER FAST, pois será enviado um link para cancelar a notificação/envio nos dados cadastrados (telefone ou e-mail) enviados para LASER FAST, sendo que ao clicar neste link automaticamente removido da lista.
É importante mencionar que, ao preencher qualquer formulário, o telefone ou e-mail do usuário será reinserido novamente à lista. Portanto, a requisição de cancelamento deve ser feita novamente caso seja o interesse do usuário.
Para alterar as informações pessoais ou mesmo excluí-las do nosso banco de dados, basta contatar-nos.

9. Período de Tratamento dos Dados
À LASER FAST é permitida manter e utilizar os dados pessoais do usuário durante todo o período contratualmente firmado para as finalidades relacionadas nesse termo e ainda após o término da contratação para cumprimento de obrigação legal ou impostas por órgãos de fiscalização, nos termos do artigo 1 da Lei Federal n° 13.709/2018.
Este consentimento poderá ser revogado pelo usuário, a qualquer momento, mediante solicitação via e-mail ou correspondência à LASER FAST.

10. Propriedade Intelectual
A LASER FAST assegura que as informações (textos, imagens, sons e/ou aplicativos) contidas nas suas Plataformas (Sites e Apps) estão de acordo com a legislação e normativos que regulam os direitos de propriedade intelectual (autoral e industrial), bem como pertencem à LASER FAST ou a terceiro que licitamente cedeu o seu direito de uso, não sendo permitidas modificações, cópias, reproduções ou quaisquer outras formas de utilização para fins comerciais sem o consentimento prévio e expresso da LASER FAST.
O Usuário declara desde já que irá respeitar todos os direitos de propriedade intelectual contidos nos nossos Serviços, ciente de que o direito de acesso ao Serviço não concede qualquer autorização para uso de direitos de propriedade intelectual constantes de tal Serviço.

11. Contato com a LASER FAST
Em caso de dúvidas com relação a esta Política de Privacidade pode ser esclarecida pelo canal de atendimento lgpd@laserfast.com.br.

12. Lei aplicável e resolução de conflitos
Toda e qualquer controvérsia oriunda dos termos expostos nesta Política e nos Termos e Condições de Uso será solucionada de acordo com a lei brasileira, sendo competente o foro da cidade de São José do Rio Preto, Estado de São Paulo, com exclusão de qualquer outro por mais privilegiado que seja.
A utilização de Serviços e as ordens comandadas fora do território brasileiro, ou ainda as decorrentes de operações iniciadas no exterior podem estar sujeitas também à legislação e jurisdição das autoridades dos países onde forem comandadas ou iniciadas.""";
  }

  @action
  void resetPoliticasDePrivacidade() {}
}
