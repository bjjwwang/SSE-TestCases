; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  store i8* %arraydecay, i8** %data, align 8, !dbg !25
  %call = call i32 @staticReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  %call2 = call i8* @strcpy(i8* %arraydecay1, i8* %3) #5, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %4), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* null) #5, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 %conv) #5, !dbg !62
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_good(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_bad(), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !70 {
entry:
  ret i32 1, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  store i8* %arraydecay, i8** %data, align 8, !dbg !80
  %call = call i32 @staticReturnsFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %call2 = call i8* @strcpy(i8* %arraydecay1, i8* %3) #5, !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %4), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !101 {
entry:
  ret i32 0, !dbg !102
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i8* %arraydecay, i8** %data, align 8, !dbg !109
  %call = call i32 @staticReturnsTrue(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %0 = load i8*, i8** %data, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !115
  %1 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !121
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !122
  %3 = load i8*, i8** %data, align 8, !dbg !123
  %call2 = call i8* @strcpy(i8* %arraydecay1, i8* %3) #5, !dbg !124
  %4 = load i8*, i8** %data, align 8, !dbg !125
  call void @printLine(i8* %4), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 39, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 40, column: 10, scope: !11)
!24 = !DILocation(line: 41, column: 12, scope: !11)
!25 = !DILocation(line: 41, column: 10, scope: !11)
!26 = !DILocation(line: 42, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 8)
!28 = !DILocation(line: 42, column: 8, scope: !11)
!29 = !DILocation(line: 45, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !12, line: 43, column: 5)
!31 = !DILocation(line: 45, column: 9, scope: !30)
!32 = !DILocation(line: 46, column: 9, scope: !30)
!33 = !DILocation(line: 46, column: 21, scope: !30)
!34 = !DILocation(line: 47, column: 5, scope: !30)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 49, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 49, column: 14, scope: !36)
!41 = !DILocation(line: 51, column: 16, scope: !36)
!42 = !DILocation(line: 51, column: 22, scope: !36)
!43 = !DILocation(line: 51, column: 9, scope: !36)
!44 = !DILocation(line: 52, column: 19, scope: !36)
!45 = !DILocation(line: 52, column: 9, scope: !36)
!46 = !DILocation(line: 54, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cpy_08_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocation(line: 107, column: 5, scope: !47)
!49 = !DILocation(line: 108, column: 5, scope: !47)
!50 = !DILocation(line: 109, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !52, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 121, type: !54)
!57 = !DILocation(line: 121, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 121, type: !55)
!59 = !DILocation(line: 121, column: 27, scope: !51)
!60 = !DILocation(line: 124, column: 22, scope: !51)
!61 = !DILocation(line: 124, column: 12, scope: !51)
!62 = !DILocation(line: 124, column: 5, scope: !51)
!63 = !DILocation(line: 126, column: 5, scope: !51)
!64 = !DILocation(line: 127, column: 5, scope: !51)
!65 = !DILocation(line: 128, column: 5, scope: !51)
!66 = !DILocation(line: 131, column: 5, scope: !51)
!67 = !DILocation(line: 132, column: 5, scope: !51)
!68 = !DILocation(line: 133, column: 5, scope: !51)
!69 = !DILocation(line: 135, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !71, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!54}
!73 = !DILocation(line: 27, column: 5, scope: !70)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 63, type: !16)
!76 = !DILocation(line: 63, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 64, type: !20)
!78 = !DILocation(line: 64, column: 10, scope: !74)
!79 = !DILocation(line: 65, column: 12, scope: !74)
!80 = !DILocation(line: 65, column: 10, scope: !74)
!81 = !DILocation(line: 66, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !74, file: !12, line: 66, column: 8)
!83 = !DILocation(line: 66, column: 8, scope: !74)
!84 = !DILocation(line: 69, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 67, column: 5)
!86 = !DILocation(line: 70, column: 5, scope: !85)
!87 = !DILocation(line: 74, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !12, line: 72, column: 5)
!89 = !DILocation(line: 74, column: 9, scope: !88)
!90 = !DILocation(line: 75, column: 9, scope: !88)
!91 = !DILocation(line: 75, column: 20, scope: !88)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !12, line: 78, type: !37)
!93 = distinct !DILexicalBlock(scope: !74, file: !12, line: 77, column: 5)
!94 = !DILocation(line: 78, column: 14, scope: !93)
!95 = !DILocation(line: 80, column: 16, scope: !93)
!96 = !DILocation(line: 80, column: 22, scope: !93)
!97 = !DILocation(line: 80, column: 9, scope: !93)
!98 = !DILocation(line: 81, column: 19, scope: !93)
!99 = !DILocation(line: 81, column: 9, scope: !93)
!100 = !DILocation(line: 83, column: 1, scope: !74)
!101 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !71, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 32, column: 5, scope: !101)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 88, type: !16)
!105 = !DILocation(line: 88, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !12, line: 89, type: !20)
!107 = !DILocation(line: 89, column: 10, scope: !103)
!108 = !DILocation(line: 90, column: 12, scope: !103)
!109 = !DILocation(line: 90, column: 10, scope: !103)
!110 = !DILocation(line: 91, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !12, line: 91, column: 8)
!112 = !DILocation(line: 91, column: 8, scope: !103)
!113 = !DILocation(line: 94, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 92, column: 5)
!115 = !DILocation(line: 94, column: 9, scope: !114)
!116 = !DILocation(line: 95, column: 9, scope: !114)
!117 = !DILocation(line: 95, column: 20, scope: !114)
!118 = !DILocation(line: 96, column: 5, scope: !114)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 98, type: !37)
!120 = distinct !DILexicalBlock(scope: !103, file: !12, line: 97, column: 5)
!121 = !DILocation(line: 98, column: 14, scope: !120)
!122 = !DILocation(line: 100, column: 16, scope: !120)
!123 = !DILocation(line: 100, column: 22, scope: !120)
!124 = !DILocation(line: 100, column: 9, scope: !120)
!125 = !DILocation(line: 101, column: 19, scope: !120)
!126 = !DILocation(line: 101, column: 9, scope: !120)
!127 = !DILocation(line: 103, column: 1, scope: !103)
