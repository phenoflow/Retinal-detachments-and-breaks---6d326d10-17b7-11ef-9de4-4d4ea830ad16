cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  retinal-detachments-and-breaks-laser---primary:
    run: retinal-detachments-and-breaks-laser---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  total-retinal-detachments-and-breaks---primary:
    run: total-retinal-detachments-and-breaks---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: retinal-detachments-and-breaks-laser---primary/output
  retinal-detachments-and-breaks-defects---primary:
    run: retinal-detachments-and-breaks-defects---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: total-retinal-detachments-and-breaks---primary/output
  partial-retinal-detachments-and-breaks---primary:
    run: partial-retinal-detachments-and-breaks---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: retinal-detachments-and-breaks-defects---primary/output
  retinal-detachments-and-breaks-traction---primary:
    run: retinal-detachments-and-breaks-traction---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: partial-retinal-detachments-and-breaks---primary/output
  other-retinal-detachments-and-breaks---primary:
    run: other-retinal-detachments-and-breaks---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: retinal-detachments-and-breaks-traction---primary/output
  retinal-detachments-and-breaks---primary:
    run: retinal-detachments-and-breaks---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: other-retinal-detachments-and-breaks---primary/output
  multiple-retinal-detachments-and-breaks---primary:
    run: multiple-retinal-detachments-and-breaks---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: retinal-detachments-and-breaks---primary/output
  retinal-detachments-and-breaks-photocoagulation---primary:
    run: retinal-detachments-and-breaks-photocoagulation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: multiple-retinal-detachments-and-breaks---primary/output
  retinal-detachments-and-breaks-unspecified---primary:
    run: retinal-detachments-and-breaks-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: retinal-detachments-and-breaks-photocoagulation---primary/output
  retinal-detachments-and-breaks-xenon---primary:
    run: retinal-detachments-and-breaks-xenon---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: retinal-detachments-and-breaks-unspecified---primary/output
  detachment---primary:
    run: detachment---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: retinal-detachments-and-breaks-xenon---primary/output
  recent-retinal-detachments-and-breaks---primary:
    run: recent-retinal-detachments-and-breaks---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: detachment---primary/output
  break---primary:
    run: break---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: recent-retinal-detachments-and-breaks---primary/output
  breaks---primary:
    run: breaks---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: break---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: breaks---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
