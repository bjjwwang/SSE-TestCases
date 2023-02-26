; ModuleID = 'linux_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  store i32* null, i32** %data, align 8, !dbg !29
  %call = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType* %myUnion to i32**, !dbg !42
  store i32* %3, i32** %unionFirst, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !44, metadata !DIExpression()), !dbg !46
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType* %myUnion to i32**, !dbg !47
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !47
  store i32* %4, i32** %data1, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !54
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx3, align 4, !dbg !57
  %5 = load i32*, i32** %data1, align 8, !dbg !58
  %6 = bitcast i32* %5 to i8*, !dbg !59
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !59
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !59
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !59
  %8 = load i32*, i32** %data1, align 8, !dbg !60
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !60
  store i32 0, i32* %arrayidx5, align 4, !dbg !61
  %9 = load i32*, i32** %data1, align 8, !dbg !62
  call void @printWLine(i32* %9), !dbg !63
  %10 = load i32*, i32** %data1, align 8, !dbg !64
  %11 = bitcast i32* %10 to i8*, !dbg !64
  call void @free(i8* %11) #6, !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #6, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #6, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType* %myUnion, metadata !93, metadata !DIExpression()), !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !96
  %0 = bitcast i8* %call to i32*, !dbg !97
  store i32* %0, i32** %data, align 8, !dbg !98
  %1 = load i32*, i32** %data, align 8, !dbg !99
  %cmp = icmp eq i32* %1, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %3 = load i32*, i32** %data, align 8, !dbg !107
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType* %myUnion to i32**, !dbg !108
  store i32* %3, i32** %unionFirst, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !110, metadata !DIExpression()), !dbg !112
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType* %myUnion to i32**, !dbg !113
  %4 = load i32*, i32** %unionSecond, align 8, !dbg !113
  store i32* %4, i32** %data1, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !118
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx3, align 4, !dbg !120
  %5 = load i32*, i32** %data1, align 8, !dbg !121
  %6 = bitcast i32* %5 to i8*, !dbg !122
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !122
  %7 = bitcast i32* %arraydecay4 to i8*, !dbg !122
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 400, i1 false), !dbg !122
  %8 = load i32*, i32** %data1, align 8, !dbg !123
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !123
  store i32 0, i32* %arrayidx5, align 4, !dbg !124
  %9 = load i32*, i32** %data1, align 8, !dbg !125
  call void @printWLine(i32* %9), !dbg !126
  %10 = load i32*, i32** %data1, align 8, !dbg !127
  %11 = bitcast i32* %10 to i8*, !dbg !127
  call void @free(i8* %11) #6, !dbg !128
  ret void, !dbg !129
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 78, scope: !16)
!29 = !DILocation(line: 33, column: 10, scope: !16)
!30 = !DILocation(line: 35, column: 23, scope: !16)
!31 = !DILocation(line: 35, column: 12, scope: !16)
!32 = !DILocation(line: 35, column: 10, scope: !16)
!33 = !DILocation(line: 36, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 9)
!35 = !DILocation(line: 36, column: 14, scope: !34)
!36 = !DILocation(line: 36, column: 9, scope: !16)
!37 = !DILocation(line: 36, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !17, line: 36, column: 23)
!39 = !DILocation(line: 37, column: 5, scope: !16)
!40 = !DILocation(line: 37, column: 13, scope: !16)
!41 = !DILocation(line: 38, column: 26, scope: !16)
!42 = !DILocation(line: 38, column: 13, scope: !16)
!43 = !DILocation(line: 38, column: 24, scope: !16)
!44 = !DILocalVariable(name: "data", scope: !45, file: !17, line: 40, type: !4)
!45 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!46 = !DILocation(line: 40, column: 19, scope: !45)
!47 = !DILocation(line: 40, column: 34, scope: !45)
!48 = !DILocalVariable(name: "source", scope: !49, file: !17, line: 42, type: !50)
!49 = distinct !DILexicalBlock(scope: !45, file: !17, line: 41, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 42, column: 21, scope: !49)
!54 = !DILocation(line: 43, column: 21, scope: !49)
!55 = !DILocation(line: 43, column: 13, scope: !49)
!56 = !DILocation(line: 44, column: 13, scope: !49)
!57 = !DILocation(line: 44, column: 27, scope: !49)
!58 = !DILocation(line: 46, column: 21, scope: !49)
!59 = !DILocation(line: 46, column: 13, scope: !49)
!60 = !DILocation(line: 47, column: 13, scope: !49)
!61 = !DILocation(line: 47, column: 25, scope: !49)
!62 = !DILocation(line: 48, column: 24, scope: !49)
!63 = !DILocation(line: 48, column: 13, scope: !49)
!64 = !DILocation(line: 49, column: 18, scope: !49)
!65 = !DILocation(line: 49, column: 13, scope: !49)
!66 = !DILocation(line: 52, column: 1, scope: !16)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_34_good", scope: !17, file: !17, line: 84, type: !18, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 86, column: 5, scope: !67)
!69 = !DILocation(line: 87, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 98, type: !71, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DISubroutineType(types: !72)
!72 = !{!7, !7, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !17, line: 98, type: !7)
!77 = !DILocation(line: 98, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !17, line: 98, type: !73)
!79 = !DILocation(line: 98, column: 27, scope: !70)
!80 = !DILocation(line: 101, column: 22, scope: !70)
!81 = !DILocation(line: 101, column: 12, scope: !70)
!82 = !DILocation(line: 101, column: 5, scope: !70)
!83 = !DILocation(line: 103, column: 5, scope: !70)
!84 = !DILocation(line: 104, column: 5, scope: !70)
!85 = !DILocation(line: 105, column: 5, scope: !70)
!86 = !DILocation(line: 108, column: 5, scope: !70)
!87 = !DILocation(line: 109, column: 5, scope: !70)
!88 = !DILocation(line: 110, column: 5, scope: !70)
!89 = !DILocation(line: 112, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocalVariable(name: "data", scope: !90, file: !17, line: 61, type: !4)
!92 = !DILocation(line: 61, column: 15, scope: !90)
!93 = !DILocalVariable(name: "myUnion", scope: !90, file: !17, line: 62, type: !23)
!94 = !DILocation(line: 62, column: 78, scope: !90)
!95 = !DILocation(line: 63, column: 10, scope: !90)
!96 = !DILocation(line: 65, column: 23, scope: !90)
!97 = !DILocation(line: 65, column: 12, scope: !90)
!98 = !DILocation(line: 65, column: 10, scope: !90)
!99 = !DILocation(line: 66, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !90, file: !17, line: 66, column: 9)
!101 = !DILocation(line: 66, column: 14, scope: !100)
!102 = !DILocation(line: 66, column: 9, scope: !90)
!103 = !DILocation(line: 66, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !17, line: 66, column: 23)
!105 = !DILocation(line: 67, column: 5, scope: !90)
!106 = !DILocation(line: 67, column: 13, scope: !90)
!107 = !DILocation(line: 68, column: 26, scope: !90)
!108 = !DILocation(line: 68, column: 13, scope: !90)
!109 = !DILocation(line: 68, column: 24, scope: !90)
!110 = !DILocalVariable(name: "data", scope: !111, file: !17, line: 70, type: !4)
!111 = distinct !DILexicalBlock(scope: !90, file: !17, line: 69, column: 5)
!112 = !DILocation(line: 70, column: 19, scope: !111)
!113 = !DILocation(line: 70, column: 34, scope: !111)
!114 = !DILocalVariable(name: "source", scope: !115, file: !17, line: 72, type: !50)
!115 = distinct !DILexicalBlock(scope: !111, file: !17, line: 71, column: 9)
!116 = !DILocation(line: 72, column: 21, scope: !115)
!117 = !DILocation(line: 73, column: 21, scope: !115)
!118 = !DILocation(line: 73, column: 13, scope: !115)
!119 = !DILocation(line: 74, column: 13, scope: !115)
!120 = !DILocation(line: 74, column: 27, scope: !115)
!121 = !DILocation(line: 76, column: 21, scope: !115)
!122 = !DILocation(line: 76, column: 13, scope: !115)
!123 = !DILocation(line: 77, column: 13, scope: !115)
!124 = !DILocation(line: 77, column: 25, scope: !115)
!125 = !DILocation(line: 78, column: 24, scope: !115)
!126 = !DILocation(line: 78, column: 13, scope: !115)
!127 = !DILocation(line: 79, column: 18, scope: !115)
!128 = !DILocation(line: 79, column: 13, scope: !115)
!129 = !DILocation(line: 82, column: 1, scope: !90)
