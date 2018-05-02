#!/usr/bin/env cwl-runner

cwlVersion: {{cookiecutter.cwl_version}}
class: CommandLineTool

label: {{cookiecutter.tool_label}}

doc: |
  {{cookiecutter.tool_doc}}


hints:
  - class: SoftwareRequirement
  ## List dependencies with short names
    packages:
      {{cookiecutter.required_package}}:
        specs: ["{{cookiecutter.SciCrunch}}"]
        version: ["{{cookiecutter.software_version}}"]


requirements:
  - class: DockerRequirement
    dockerPull: {{cookiecutter.dockerPull}}

  - class: InlineJavascriptRequirement


inputs:
  input1:
    type: File
    format: [edam:format_{{cookiecutter.input_format}}]
    inputBinding:
      position: {{cookiecutter.input_position}}
      prefix: {{cookiecutter.input_prefix}}
    doc: |
      {{cookiecutter.input_doc}}

  outfile_name:
    type: string
    doc: |
      Name of the outputfile. Given as String.


outputs:
  output1:
    type: stdout
    format: edam:format_{{cookiecutter.output_format}}

stdout: $(inputs.outfile_name)


baseCommand: {{cookiecutter.base_command}}



# Namespaces and Schema
$namespaces:
  edam: http://edamontology.org/
  s: http://schema.org/

$schemas:
 - http://edamontology.org/EDAM_1.18.owl
 - http://schema.org/docs/schema_org_rdfa.html


# METADATA
# Cite the underlying tool
s:mainEntity:
  class: s:SoftwareSourceCode
  s:name: "{{cookiecutter.orig_software}}"
  s:about: >
    {{cookiecutter.orig_software_description}}

  s:url: {{cookiecutter.orig_software_url}}
  s:license: {{cookiecutter.orig_software_license}}

  s:creator:
  - class: s:Person
    s:name: "{{cookiecutter.orig_software_author}}"

  #s:publication:
  #- class: s:ScholarlyArticle
  #  id: http://dx.doi.org/?????
  #  s:name: "?????"
  #  s:url: http://journal.?????

# Cite CWL
s:isPartOf:
  class: s:CreativeWork
  s:name: Common Workflow Language
  s:url: http://commonwl.org/

# Identify yourself
s:author:
  class: s:Person
  s:name: {{cookiecutter.author}}
  s:email: {{cookiecutter.email}}
  ## If you have one, use unambiguous identifiers like ORCID
  #  s:sameAs:
  #  - id: http://orcid.org/????-????-????-????
  s:worksFor:
  - class: s:Organization
    s:name: {{cookiecutter.organization}}
    s:location: {{cookiecutter.location}}
    s:department:
    - class: s:Organization
      s:name: {{cookiecutter.lab}}

# Include a license
s:license: {{cookiecutter.license}}
s:copyrightHolder:{{cookiecutter.copyright_holder}}
