# <b>Affinity</b>
- <b>NodeAffinity</b>
    - Apply all task in label matching node
- <b>NodeAntiAffinity</b>
    - Apply Only one task in each label matching node
- <b>PodAffinity</b>
    - Apply all task of same labels in a same node.
- <b>PodAntiAffinity</b>
    - Apply one task of same labels in a all node.

## Types:
- <b>preferredDuringSchedulingIgnoredDuringExecution</b>
- <b>requiredDuringSchedulingIgnoredDuringExecution</b>


## Operator:
- <b>In</b>
- <b>NotIn</b>
- <b>Exists</b>
- <b>DoesNotExist</b>
- <b>Gt</b>
- <b>Lt</b>