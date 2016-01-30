# SISTEMA DE ALOCAÇÃO DE PROJETOS - CJR

# DADOS PRÉ-DEFINIDOS NO BANCO DE DADOS

# Para modificar altere as listas que começam com 'a'
# Use 'rake db:seed' para preencher o banco de dados

a_status_de_membro = [{description: "Ativo"}, 
                      {description: "Inativo"}]

status_de_membro = MemberStatus.create(a_status_de_membro)


a_status_de_projeto = [{description: "Não iniciado"}, 
                       {description: "Em desenvolvimento"}, 
                       {description: "Atrasado"}, 
                       {description: "Concluído"}, 
                       {description: "Cancelado"}]

status_de_projeto = ProjectStatus.create(a_status_de_projeto)


a_status_de_requisicao = [{description: "Em análise"}, 
                          {description: "Deferido"}, 
                          {description: "Indeferido"}]

status_de_requisicao = RequestStatus.create(a_status_de_requisicao)


a_perfis = [{description: "Administrador"},
            {description: "Moderador"},
            {description: "Usuário"}]

perfis = Role.create(a_perfis)


a_cargos = [{description: "Trainee"}, 
            {description: "Consultor"}, 
            {description: "Gerente"}, 
            {description: "Líder"}, 
            {description: "Presidente"}]

cargos = Job.create(a_cargos)


a_niveis_de_conhecimento = [{level: "Baixo", description: "Baixo"}, 
                            {level: "Médio", description: "Médio"}, 
                            {level: "Alto", description: "Alto"}]

niveis_de_conhecimento = KnowledgeLevel.create(a_niveis_de_conhecimento)


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