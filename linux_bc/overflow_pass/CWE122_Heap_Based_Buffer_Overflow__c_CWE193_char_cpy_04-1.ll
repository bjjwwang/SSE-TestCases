; ModuleID = 'linux_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !38
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* %3), !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !42
  call void @free(i8* %4) #6, !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !69, metadata !DIExpression()), !dbg !70
  store i8* null, i8** %data, align 8, !dbg !71
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !72
  store i8* %call, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %cmp = icmp eq i8* %0, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !84
  %2 = load i8*, i8** %data, align 8, !dbg !85
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !86
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !87
  %3 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* %3), !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  call void @free(i8* %4) #6, !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i8* null, i8** %data, align 8, !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !100
  %0 = load i8*, i8** %data, align 8, !dbg !101
  %cmp = icmp eq i8* %0, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !109
  %2 = load i8*, i8** %data, align 8, !dbg !110
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !111
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %3), !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  call void @free(i8* %4) #6, !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!19 = !DILocation(line: 37, column: 12, scope: !14)
!20 = !DILocation(line: 38, column: 10, scope: !14)
!21 = !DILocation(line: 42, column: 24, scope: !22)
!22 = distinct !DILexicalBlock(scope: !23, file: !15, line: 40, column: 5)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 8)
!24 = !DILocation(line: 42, column: 14, scope: !22)
!25 = !DILocation(line: 43, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 43, column: 13)
!27 = !DILocation(line: 43, column: 18, scope: !26)
!28 = !DILocation(line: 43, column: 13, scope: !22)
!29 = !DILocation(line: 43, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 43, column: 27)
!31 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 46, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 11)
!36 = !DILocation(line: 46, column: 14, scope: !32)
!37 = !DILocation(line: 48, column: 16, scope: !32)
!38 = !DILocation(line: 48, column: 22, scope: !32)
!39 = !DILocation(line: 48, column: 9, scope: !32)
!40 = !DILocation(line: 49, column: 19, scope: !32)
!41 = !DILocation(line: 49, column: 9, scope: !32)
!42 = !DILocation(line: 50, column: 14, scope: !32)
!43 = !DILocation(line: 50, column: 9, scope: !32)
!44 = !DILocation(line: 52, column: 1, scope: !14)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_04_good", scope: !15, file: !15, line: 103, type: !16, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DILocation(line: 105, column: 5, scope: !45)
!47 = !DILocation(line: 106, column: 5, scope: !45)
!48 = !DILocation(line: 107, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 119, type: !50, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !15, line: 119, type: !52)
!55 = !DILocation(line: 119, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !15, line: 119, type: !53)
!57 = !DILocation(line: 119, column: 27, scope: !49)
!58 = !DILocation(line: 122, column: 22, scope: !49)
!59 = !DILocation(line: 122, column: 12, scope: !49)
!60 = !DILocation(line: 122, column: 5, scope: !49)
!61 = !DILocation(line: 124, column: 5, scope: !49)
!62 = !DILocation(line: 125, column: 5, scope: !49)
!63 = !DILocation(line: 126, column: 5, scope: !49)
!64 = !DILocation(line: 129, column: 5, scope: !49)
!65 = !DILocation(line: 130, column: 5, scope: !49)
!66 = !DILocation(line: 131, column: 5, scope: !49)
!67 = !DILocation(line: 133, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocalVariable(name: "data", scope: !68, file: !15, line: 61, type: !4)
!70 = !DILocation(line: 61, column: 12, scope: !68)
!71 = !DILocation(line: 62, column: 10, scope: !68)
!72 = !DILocation(line: 71, column: 24, scope: !73)
!73 = distinct !DILexicalBlock(scope: !74, file: !15, line: 69, column: 5)
!74 = distinct !DILexicalBlock(scope: !68, file: !15, line: 63, column: 8)
!75 = !DILocation(line: 71, column: 14, scope: !73)
!76 = !DILocation(line: 72, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !15, line: 72, column: 13)
!78 = !DILocation(line: 72, column: 18, scope: !77)
!79 = !DILocation(line: 72, column: 13, scope: !73)
!80 = !DILocation(line: 72, column: 28, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 72, column: 27)
!82 = !DILocalVariable(name: "source", scope: !83, file: !15, line: 75, type: !33)
!83 = distinct !DILexicalBlock(scope: !68, file: !15, line: 74, column: 5)
!84 = !DILocation(line: 75, column: 14, scope: !83)
!85 = !DILocation(line: 77, column: 16, scope: !83)
!86 = !DILocation(line: 77, column: 22, scope: !83)
!87 = !DILocation(line: 77, column: 9, scope: !83)
!88 = !DILocation(line: 78, column: 19, scope: !83)
!89 = !DILocation(line: 78, column: 9, scope: !83)
!90 = !DILocation(line: 79, column: 14, scope: !83)
!91 = !DILocation(line: 79, column: 9, scope: !83)
!92 = !DILocation(line: 81, column: 1, scope: !68)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 86, type: !4)
!95 = !DILocation(line: 86, column: 12, scope: !93)
!96 = !DILocation(line: 87, column: 10, scope: !93)
!97 = !DILocation(line: 91, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !99, file: !15, line: 89, column: 5)
!99 = distinct !DILexicalBlock(scope: !93, file: !15, line: 88, column: 8)
!100 = !DILocation(line: 91, column: 14, scope: !98)
!101 = !DILocation(line: 92, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 92, column: 13)
!103 = !DILocation(line: 92, column: 18, scope: !102)
!104 = !DILocation(line: 92, column: 13, scope: !98)
!105 = !DILocation(line: 92, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 92, column: 27)
!107 = !DILocalVariable(name: "source", scope: !108, file: !15, line: 95, type: !33)
!108 = distinct !DILexicalBlock(scope: !93, file: !15, line: 94, column: 5)
!109 = !DILocation(line: 95, column: 14, scope: !108)
!110 = !DILocation(line: 97, column: 16, scope: !108)
!111 = !DILocation(line: 97, column: 22, scope: !108)
!112 = !DILocation(line: 97, column: 9, scope: !108)
!113 = !DILocation(line: 98, column: 19, scope: !108)
!114 = !DILocation(line: 98, column: 9, scope: !108)
!115 = !DILocation(line: 99, column: 14, scope: !108)
!116 = !DILocation(line: 99, column: 9, scope: !108)
!117 = !DILocation(line: 101, column: 1, scope: !93)
