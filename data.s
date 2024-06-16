.globl head_node

# Definição do primeiro nó (head_node)
.data
head_node:
    .word 10         # Campo 1
    .word -4         # Campo 2
    .word -2         # Campo 3
    .word node_1     # Endereço do próximo nó

# Definição dos nós subsequentes
node_1:
    .word 56
    .word 78
    .word 25
    .word node_2

node_2:
    .word -654
    .word 590
    .word 1277
    .word node_3

node_3:
    .word -100
    .word -43
    .word -201
    .word node_4

# Nós adicionais
node_4:
    .word 1
    .word 2
    .word 3
    .word node_5

node_5:
    .word 4
    .word 5
    .word 6
    .word node_6

node_6:
    .word 7
    .word 8
    .word 9
    .word node_7

node_7:
    .word 10
    .word 11
    .word 12
    .word node_8

node_8:
    .word 13
    .word 14
    .word 15
    .word node_9

node_9:
    .word 16
    .word 17
    .word 18
    .word node_10

node_10:
    .word 19
    .word 20
    .word 21
    .word node_11

node_11:
    .word 22
    .word 23
    .word 24
    .word node_12

node_12:
    .word 25
    .word 26
    .word 27
    .word node_13

node_13:
    .word 28
    .word 29
    .word 30
    .word node_14

node_14:
    .word 31
    .word -32
    .word 33
    .word node_15

node_15:
    .word 34
    .word 35
    .word 36
    .word node_16

node_16:
    .word 37
    .word 38
    .word 39
    .word node_17

node_17:
    .word 40
    .word 41
    .word 42
    .word node_18

node_18:
    .word 43
    .word 44
    .word 45
    .word node_19

node_19:
    .word 46
    .word 47
    .word 48
    .word node_20

node_20:
    .word 49
    .word 50
    .word 51
    .word node_21

node_21:
    .word 52
    .word 53
    .word 54
    .word node_22

node_22:
    .word 55
    .word 56
    .word 57
    .word node_23

node_23:
    .word 58
    .word 59
    .word 60
    .word node_24

node_24:
    .word 61
    .word 62
    .word 63
    .word node_25

node_25:
    .word 64
    .word 65
    .word 66
    .word node_26

node_26:
    .word 67
    .word 68
    .word 69
    .word node_27

node_27:
    .word 70
    .word 71
    .word 72
    .word node_28

node_28:
    .word 73
    .word 74
    .word 75
    .word node_29

node_29:
    .word 76
    .word 77
    .word 78
    .word node_30

node_30:
    .word 79
    .word 80
    .word 81
    .word node_31

node_31:
    .word 82
    .word 83
    .word 84
    .word node_32

node_32:
    .word 85
    .word 86
    .word 87
    .word node_33

node_33:
    .word 88
    .word 89
    .word 90
    .word node_34

node_34:
    .word 91
    .word 92
    .word 93
    .word node_35

node_35:
    .word 94
    .word 95
    .word 96
    .word node_36

node_36:
    .word 97
    .word 98
    .word 99
    .word node_37

node_37:
    .word 100
    .word 101
    .word 102
    .word node_38

node_38:
    .word 103
    .word 104
    .word 105
    .word node_39

node_39:
    .word 106
    .word 107
    .word 108
    .word node_40

node_40:
    .word 109
    .word 110
    .word 111
    .word node_41

node_41:
    .word 112
    .word 113
    .word 114
    .word node_42

node_42:
    .word 115
    .word 116
    .word 117
    .word node_43

node_43:
    .word 118
    .word 119
    .word 120
    .word node_44

node_44:
    .word 121
    .word 122
    .word 123
    .word node_45

node_45:
    .word 124
    .word 125
    .word 126
    .word node_46

node_46:
    .word 127
    .word 128
    .word 129
    .word node_47

node_47:
    .word 130
    .word 131
    .word 132
    .word node_48

node_48:
    .word 133
    .word 134
    .word 135
    .word node_49

node_49:
    .word 136
    .word 137
    .word 138
    .word node_50

node_50:
    .word 139
    .word 140
    .word 141
    .word node_51

node_51:
    .word 142
    .word 143
    .word 144
    .word node_52

node_52:
    .word 145
    .word 146
    .word 147
    .word node_53

node_53:
    .word 148
    .word 149
    .word 150
    .word node_54

node_54:
    .word 151
    .word 152
    .word 153
    .word node_55

node_55:
    .word 154
    .word 155
    .word 156
    .word node_56

node_56:
    .word 157
    .word 158
    .word 159
    .word node_57

node_57:
    .word 160
    .word 161
    .word 162
    .word node_58

node_58:
    .word 163
    .word 164
    .word 165
    .word node_59

node_59:
    .word 166
    .word 167
    .word 168
    .word node_60

node_60:
    .word 169
    .word 170
    .word 171
    .word node_61

node_61:
    .word 172
    .word 173
    .word 174
    .word node_62

node_62:
    .word 175
    .word 176
    .word 177
    .word node_63

node_63:
    .word 178
    .word 179
    .word 180
    .word node_64

node_64:
    .word 181
    .word 182
    .word 183
    .word node_65

node_65:
    .word 184
    .word 185
    .word 186
    .word node_66

node_66:
    .word 187
    .word 188
    .word 189
    .word node_67

node_67:
    .word 190
    .word -191
    .word 192
    .word node_68

node_68:
    .word 193
    .word 194
    .word 195
    .word node_69

node_69:
    .word 196
    .word -197
    .word 198
    .word node_70

node_70:
    .word 199
    .word 200
    .word 201
    .word node_71

node_71:
    .word 202
    .word 203
    .word 204
    .word node_72

node_72:
    .word 205
    .word 206
    .word 207
    .word node_73

node_73:
    .word 208
    .word 209
    .word 210
    .word node_74

node_74:
    .word 211
    .word 212
    .word 213
    .word node_75

node_75:
    .word 214
    .word 215
    .word 216
    .word node_76

node_76:
    .word 217
    .word 218
    .word 219
    .word node_77

node_77:
    .word 220
    .word 221
    .word 222
    .word node_78

node_78:
    .word 223
    .word 224
    .word 225
    .word node_79

node_79:
    .word 226
    .word 227
    .word 228
    .word node_80

node_80:
    .word 229
    .word 230
    .word 231
    .word node_81

node_81:
    .word 232
    .word 233
    .word 234
    .word node_82

node_82:
    .word 235
    .word 236
    .word 237
    .word node_83

node_83:
    .word 238
    .word 239
    .word 240
    .word node_84

node_84:
    .word 241
    .word 242
    .word 243
    .word node_85

node_85:
    .word 244
    .word 245
    .word -246
    .word node_86

node_86:
    .word 247
    .word 248
    .word 249
    .word node_87

node_87:
    .word 250
    .word 251
    .word 252
    .word node_88

node_88:
    .word -253
    .word 254
    .word 255
    .word node_89

node_89:
    .word 256
    .word 257
    .word 258
    .word node_90

node_90:
    .word 259
    .word -260
    .word 261
    .word node_91

node_91:
    .word 262
    .word 263
    .word 264
    .word node_92

node_92:
    .word 265
    .word 266
    .word 267
    .word node_93

node_93:
    .word 268
    .word 269
    .word 270
    .word node_94

node_94:
    .word -271
    .word 272
    .word 273
    .word node_95

node_95:
    .word 274
    .word 275
    .word 276
    .word node_96

node_96:
    .word 277
    .word -278
    .word 279
    .word node_97

node_97:
    .word 280
    .word 281
    .word 282
    .word node_98

node_98:
    .word 283
    .word -284
    .word 285
    .word node_99

node_99:
    .word 286
    .word 287
    .word 288
    .word node_100

node_100:
    .word 289
    .word 290
    .word 291
    .word 0     # Último nó, próximo nó é 0

