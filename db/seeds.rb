# SISTEMA DE ALOCAÇÃO DE PROJETOS - CJR

# DADOS PRÉ-DEFINIDOS NO BANCO DE DADOS

# Para modificar altere as listas que começam com 'a'
# Use 'rake db:seed' para preencher o banco de dados

# STATUS DE MEMBRO

a_status_de_membro = [{description: "Ativo"}, 
                      {description: "Inativo"}]

status_de_membro = MemberStatus.create(a_status_de_membro)

ativo = status_de_membro[0].id
inativo = status_de_membro[1].id

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

baixo = niveis_de_conhecimento[0].id
medio = niveis_de_conhecimento[1].id
alto = niveis_de_conhecimento[2].id

# NÚCLEOS

a_nucleos = [{short_name: "NDP", name: "Núcleo de Desenvolvimento e Pesquisa", description: "N/A"},
             {short_name: "NUT", name: "Núcleo de Talentos", description: "N/A"},
             {short_name: "NAM", name: "Núcleo de Atendimento e Marketing", description: "N/A"},
             {short_name: "NOE", name: "Núcleo de Organização Empresarial", description: "N/A"},
             {short_name: "PRES", name: "Presidência", description: "N/A"},
             {short_name: "N/A", name: "N/A", description: "N/A"}]

nucleos = Sector.create(a_nucleos)

ndp = nucleos[0].id
nut = nucleos[1].id
nam = nucleos[2].id
noe = nucleos[3].id
pres = nucleos[4].id
sna = nucleos[5].id

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

           {name: "N/A NDP", sector_id: ndp},
           {name: "N/A NUT", sector_id: nut},
           {name: "N/A NAM", sector_id: nam},
           {name: "N/A NOE", sector_id: noe},
           {name: "N/A PRES", sector_id: pres},

           {name: "N/A", sector_id: sna}]

areas = Area.create(a_areas)

na = areas[18].id

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

html = tecnologias[0].id
css = tecnologias[1].id
php = tecnologias[2].id
code_igniter = tecnologias[3].id
ruby = tecnologias[4].id
rails = tecnologias[5].id
javascript = tecnologias[6].id
jquery = tecnologias[7].id
slim = tecnologias[8].id
sass = tecnologias[9].id
angular_js = tecnologias[10].id
git = tecnologias[11].id

# TIPOS DE ATIVIDADE

a_tipos_de_atividade = [{description: "Empresa Júnior"}, 
                        {description: "Matéria da UnB"},
                        {description: "Cursos"},
                        {description: "Trabalho"},
                        {description: "Estágio Remunerado"},
                        {description: "Estágio Obrigatório"},
                        {description: "Lazer"},
                        {description: "Bolsas"}]

tipos_de_atividade = ActivityType.create(a_tipos_de_atividade)

empresa_junior = tipos_de_atividade[0].id
materia_unb = tipos_de_atividade[1].id
cursos = tipos_de_atividade[2].id
trabalho = tipos_de_atividade[3].id
estagio_remunerado = tipos_de_atividade[4].id
estagio_obrigatorio = tipos_de_atividade[5].id
lazer = tipos_de_atividade[6].id
bolsas = tipos_de_atividade[7].id

# ATIVIDADES

a_atividades = [{description: "Empresa Júnior de Computação", activity_type_id: empresa_junior, credit_numbers: 16},
                {description: "Estágio 20h", activity_type_id: estagio_remunerado, credit_numbers: 22},
                {description: "Estágio 30h", activity_type_id: estagio_remunerado, credit_numbers: 33},
                {description: "Trabalho 20h", activity_type_id: trabalho, credit_numbers: 22},
                {description: "Trabalho 30h", activity_type_id: trabalho, credit_numbers: 33},
                {description: "Trabalho 40h", activity_type_id: trabalho, credit_numbers: 44},
                {description: "Monitoria", activity_type_id: materia_unb, credit_numbers: 2},
                {description: "Programa de Bolsa de Iniciação Científica", activity_type_id: bolsas, credit_numbers: 2},
                {description: "Programa de Bolsa de Iniciação à Docência", activity_type_id: bolsas, credit_numbers: 2}]

atividades = Activity.create(a_atividades)

# CONHECIMENTOS

a_conhecimentos = [{description: "Basic Elements", knowledge_level_id: baixo, technology_id: html},
                   {description: "Document Metadata", knowledge_level_id: baixo, technology_id: html}, 
                   {description: "Document Metadata", knowledge_level_id: medio, technology_id: html}, 
                   {description: "Document Metadata", knowledge_level_id: alto, technology_id: html}, 
                   {description: "Content Sectioning", knowledge_level_id: baixo, technology_id: html}, 
                   {description: "Content Sectioning", knowledge_level_id: medio, technology_id: html}, 
                   {description: "Content Sectioning", knowledge_level_id: alto, technology_id: html}, 
                   {description: "Text Content", knowledge_level_id: baixo, technology_id: html}, 
                   {description: "Text Content", knowledge_level_id: medio, technology_id: html}, 
                   {description: "Text Content", knowledge_level_id: alto, technology_id: html}, 
                   {description: "Inline Text Semantics", knowledge_level_id: baixo, technology_id: html}, 
                   {description: "Inline Text Semantics", knowledge_level_id: medio, technology_id: html}, 
                   {description: "Inline Text Semantics", knowledge_level_id: alto, technology_id: html}, 
                   {description: "Image and Multimedia", knowledge_level_id: baixo, technology_id: html}, 
                   {description: "Image and Multimedia", knowledge_level_id: medio, technology_id: html}, 
                   {description: "Image and Multimedia", knowledge_level_id: alto, technology_id: html}, 
                   {description: "Embedded Content", knowledge_level_id: baixo, technology_id: html}, 
                   {description: "Embedded Content", knowledge_level_id: medio, technology_id: html}, 
                   {description: "Embedded Content", knowledge_level_id: alto, technology_id: html}, 
                   {description: "Scripting", knowledge_level_id: baixo, technology_id: html}, 
                   {description: "Scripting", knowledge_level_id: medio, technology_id: html}, 
                   {description: "Scripting", knowledge_level_id: alto, technology_id: html},
                   {description: "Demarcating Edits", knowledge_level_id: baixo, technology_id: html},
                   {description: "Demarcating Edits", knowledge_level_id: medio, technology_id: html},
                   {description: "Demarcating Edits", knowledge_level_id: alto, technology_id: html},
                   {description: "Table of Content", knowledge_level_id: baixo, technology_id: html},
                   {description: "Table of Content", knowledge_level_id: medio, technology_id: html},
                   {description: "Table of Content", knowledge_level_id: alto, technology_id: html},
                   {description: "Forms", knowledge_level_id: baixo, technology_id: html},
                   {description: "Forms", knowledge_level_id: medio, technology_id: html},
                   {description: "Forms", knowledge_level_id: alto, technology_id: html},
                   {description: "Interative Elements", knowledge_level_id: baixo, technology_id: html},
                   {description: "Interative Elements", knowledge_level_id: medio, technology_id: html},
                   {description: "Interative Elements", knowledge_level_id: alto, technology_id: html},
                   {description: "Web Content", knowledge_level_id: baixo, technology_id: html},
                   {description: "Web Content", knowledge_level_id: medio, technology_id: html},
                   {description: "Web Content", knowledge_level_id: alto, technology_id: html}
                    ]

conhecimentos = Knowledge.create(a_conhecimentos)

# MEMBROS

a_membros = [{name: "Afonso", last_name: "Dias", email: "afonsodias@cjr.org.br", password: "dias123", 
             sector_id: nut, job_id: lider, area_id: na, member_status_id: ativo, role_id: mod},

            {name: "Anne", last_name: "Carolina", email: "annecarolina@cjr.org.br", password: "carolina123",
             sector_id: nam, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Bruno", last_name: "Helder", email: "brunohelder@cjr.org.br", password: "helder123",
             sector_id: nut, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Bruno", last_name: "Oliveira Gomes", email: "brunooliveira@cjr.org.br", password: "oliveira123",
             sector_id: ndp, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Claudio", last_name: "Segala", email: "claudiosegala@cjr.org.br", password:"segala123",
             sector_id: nut, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Cristiane", last_name: "Cardoso Naves", email: "cristianenaves@cjr.org.br", password:"naves123",
             sector_id: nam, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Danilo", last_name: "Santos", email: "danilosantos@cjr.org.br", password:"santos123",
             sector_id: nam, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Eduardo", last_name: "Araújo Cunha", email: "eduardoaraujo@cjr.org.br", password: "araujo123",
             sector_id: nut, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Evandro", last_name: "Roberto Mota", email: "evandroroberto@cjr.org.br", password: "mota123",
             sector_id: nut, job_id: consultor, area_id: na, member_status_id: inativo, role_id: user},

            {name: "Gabriel", last_name: "Almeida Campos", email: "gabrielalmeida@cjr.org.br", password: "almeida123",
             sector_id: nam, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Gabriel", last_name: "Mesquita Araújo", email: "gabrielmesquita@cjr.org.br", password: "mesquita123",
             sector_id: noe, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Hugo", last_name: "Fagundes", email: "hugofagundes@cjr.org.br", password: "fagundes123",
             sector_id: nam, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Igor", last_name: "Sodré", email: "igorsodre@cjr.org.br", password: "sodre123",
             sector_id: nam, job_id: consultor, area_id: na, member_status_id: inativo, role_id: user},

            {name: "José", last_name: "Marcos da Silva Leite", email: "josemarcos@cjr.org.br", password: "marcos123",
             sector_id: ndp, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Khalil", last_name: "Carsten do Nascimento", email: "khalilcarsten@cjr.org.br", password: "carsten123",
             sector_id: ndp, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Lucas", last_name: "Mafra Chagas", email: "lucasmafra@cjr.org.br", password: "mafra123",
             sector_id: noe, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Luiz", last_name: "Fernando Vieira de Castro Ferreira", email: "luizfernando@cjr.org.br", password: "ferreira123",
             sector_id: ndp, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Marcelo", last_name: "Bulhões da Fonseca", email: "marcelobulhoes@cjr.org.br", password: "fonseca123",
             sector_id: sna, job_id: consultor, area_id: na, member_status_id: inativo, role_id: user},

            {name: "Marcus", last_name: "Vinícius da Silva Borges", email: "marcusvinicius@cjr.org.br", password: "borges123",
             sector_id: noe, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Mateus", last_name: "Luiz Freitas Barros", email: "mateusluiz@cjr.org.br", password: "barros123",
             sector_id: nut, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Mateus", last_name: "Nogueira Brumano Castro", email: "mateusnogueira@cjr.org.br", password: "castro123",
             sector_id: noe, job_id: consultor, area_id: na, member_status_id: inativo, role_id: user},

            {name: "Patrícia", last_name: "Deud Guimarães", email: "patriciaguimaraes@cjr.org.br", password: "guimaraes123",
             sector_id: sna, job_id: consultor, area_id: na, member_status_id: inativo, role_id: user},

            {name: "Rafael", last_name: "Alves Fernandes", email: "rafaelalves@cjr.org.br", password: "fernandes123",
             sector_id: noe, job_id: consultor, area_id: na, member_status_id: ativo, role_id: admin},

            {name: "Rafael", last_name: "Dias Silveira", email: "rafaeldias@cjr.org.br", password: "dias123",
             sector_id: nam, job_id: lider, area_id: na, member_status_id: ativo, role_id: mod},

            {name: "Renan", last_name: "Lobato Rheinboldt", email: "renanlobato@cjr.org.br", password: "lobato123",
             sector_id: sna, job_id: consultor, area_id: na, member_status_id: inativo, role_id: user},

            {name: "Renan", last_name: "Rocha Reboredo", email: "renanreboredo@cjr.org.br", password: "reboredo123",
             sector_id: pres, job_id: presidente, area_id: na, member_status_id: ativo, role_id: mod},

            {name: "Rodrigo", last_name: "de Araújo Chaves", email: "rodrigochaves@cjr.org.br", password: "chaves123",
             sector_id: ndp, job_id: lider, area_id: na, member_status_id: ativo, role_id: admin},

            {name: "Rebeca", last_name: "Andrade Baldomir", email: "rebecaandrade@cjr.org.br", password: "andrade123",
             sector_id: ndp, job_id: gerente, area_id: na, member_status_id: ativo, role_id: mod},

            {name: "Vinícius", last_name: "Corrêa", email: "viniciusalmeida@cjr.org.br", password: "almeida123",
             sector_id: ndp, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Vitor", last_name: "Passos Pontes", email: "vitorpontes@cjr.org.br", password: "pontes123",
             sector_id: noe, job_id: lider, area_id: na, member_status_id: ativo, role_id: mod},

            {name: "Vitor", last_name: "Mateus Costa do Rego", email: "vitormateus@cjr.org.br", password: "mateus123",
             sector_id: nam, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user},

            {name: "Wladimir", last_name: "Mesquita Gramacho", email: "wladimirgramacho@cjr.org.br", password: "gramacho123",
             sector_id: nam, job_id: consultor, area_id: na, member_status_id: ativo, role_id: user}]

membros = Member.create(a_membros)