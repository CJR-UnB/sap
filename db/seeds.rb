# SISTEMA DE ALOCAÇÃO DE PROJETOS - CJR

# DADOS PRÉ-DEFINIDOS NO BANCO DE DADOS

# Para modificar altere as listas que começam com 'a'
# Use 'rake db:seed' para preencher o banco de dados

# STATUS DE MEMBRO

a_status_de_membro = [{description: "Ativo"}, 
                      {description: "Inativo"}]

status_de_membro = MemberStatus.create(a_status_de_membro)

# STATUS DE PROJETO

a_status_de_projeto = [{description: "Não iniciado"}, 
                       {description: "Em desenvolvimento"}, 
                       {description: "Atrasado"}, 
                       {description: "Concluído"}]

status_de_projeto = ProjectStatus.create(a_status_de_projeto)

# STATUS DE REQUISIÇÃO DE CONHECIMENTO

a_status_de_requisicao = [{description: "Em análise"}, 
                          {description: "Deferido"}, 
                          {description: "Indeferido"}]

status_de_requisicao = RequestStatus.create(a_status_de_requisicao)

# PERFIS DE MEMBRO

a_perfis = [{description: "Administrador"},
            {description: "Moderador"},
            {description: "Usuário"}]

perfis = Role.create(a_perfis)

admin = perfis[0].id
mod = perfis[1].id
user = perfis[2].id

# CARGOS DE MEMBRO

a_cargos = [{description: "Trainee"}, 
            {description: "Consultor"}, 
            {description: "Gerente"}, 
            {description: "Líder"}, 
            {description: "Presidente"}]

cargos = Job.create(a_cargos)

trainee = cargos[0].id
consultor = cargos[1].id
gerente = cargos[2].id
lider = cargos[3].id
presidente = cargos[4].id

# NÍVEIS DE CONHECIMENTO

a_niveis_de_conhecimento = [{level: "Baixo", description: "Baixo"}, 
                            {level: "Médio", description: "Médio"}, 
                            {level: "Alto", description: "Alto"}]

niveis_de_conhecimento = KnowledgeLevel.create(a_niveis_de_conhecimento)

# NÚCLEOS

a_nucleos = [{short_name: "NDP", name: "Núcleo de Desenvolvimento e Pesquisa", description: "N/A"},
             {short_name: "NUT", name: "Núcleo de Talentos", description: "N/A"},
             {short_name: "NAM", name: "Núcleo de Atendimento e Marketing", description: "N/A"},
             {short_name: "NOE", name: "Núcleo de Organização Empresarial", description: "N/A"},
             {short_name: "PRES", name: "Presidência", description: "N/A"}]

nucleos = Sector.create(a_nucleos)

ndp = nucleos[0].id
nut = nucleos[1].id
nam = nucleos[2].id
noe = nucleos[3].id
pres = nucleos[4].id

# ÁREAS

a_areas = [{name: "Inovação", sector_id: ndp},
           {name: "Suporte", sector_id: ndp},
           {name: "Projetos", sector_id: ndp},
           {name: "Tecnologia da Informação", sector_id: ndp},

           {name: "Capacitação", sector_id: nut},
           {name: "Acompanhamento", sector_id: nut},
           {name: "Integração", sector_id: nut},
           {name: "Seleção", sector_id: nut},

           {name: "Negócios", sector_id: nam},
           {name: "Marketing", sector_id: nam},

           {name: "Financeiro", sector_id: noe},
           {name: "Administrativo", sector_id: noe},
           {name: "Gestão Organizacional", sector_id: noe},

           {name: "N/A", sector_id: ndp},
           {name: "N/A", sector_id: nut},
           {name: "N/A", sector_id: nam},
           {name: "N/A", sector_id: noe},
           {name: "N/A", sector_id: pres}]

areas = Area.create(a_areas)

# FUNÇÕES DE PROJETO

a_funcoes_de_projeto = [{description: "Gerente"},
                        {description: "Desenvolvedor"}]

funcoes_de_projeto = ProjectRole.create(a_funcoes_de_projeto)

# TECNOLOGIAS

a_tecnologias = [{name: "HTML", description: "Linuagem de Marcação de Texto"},
                 {name: "CSS", description: "Linguagem de Estilo em Cascata"},
                 {name: "PHP", description: "Linguagem de Programação"},
                 {name: "CodeIgniter", description: "Framework WEB"},
                 {name: "Ruby", description: "Linguagem de Programação"},
                 {name: "Rails", description: "Framework WEB"},
                 {name: "Javascript", description: "Linguagem de Programação"},
                 {name: "JQuery", description: "Biblioteca Javascript"},
                 {name: "Slim", description: "Linguagem de Template"},
                 {name: "Sass", description: "Extensão CSS"},
                 {name: "AngularJS", description: "Framework WEB"},
                 {name: "Git", description: "Sistema de Controle de Versão"}]

tecnologias = Technology.create(a_tecnologias)

# TIPOS DE ATIVIDADE

a_tipos_de_atividade = [{description: "Empresa Júnior"}, 
                        {description: "Matéria da UnB"},
                        {description: "Cursos"},
                        {description: "Trabalho"},
                        {description: "Estágio Remunerado"},
                        {description: "Estágio Obrigatório"},
                        {description: "Lazer"}]

tipos_de_atividade = ActivityType.create(a_tipos_de_atividade)

# MEMBROS

a_membros = [{name: "Rafael", last_name: "Alves Fernandes", email: "rafaelalves@cjr.org.br", password: "fernandes123",
              role_id: admin, sector_id: noe, job_id: consultor}]

membros = Member.create(a_membros)