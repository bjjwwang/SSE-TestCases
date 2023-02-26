; ModuleID = 'linux_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !31
  %tobool = icmp ne i32 %call1, 0, !dbg !31
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !33

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  br label %if.end4, !dbg !39

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !45
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  %call5 = call i32* @wcscat(i32* %arraydecay, i32* %5) #6, !dbg !48
  %6 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %6), !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  %8 = bitcast i32* %7 to i8*, !dbg !51
  call void @free(i8* %8) #6, !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !78 {
entry:
  ret i32 1, !dbg !81
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !85
  %0 = bitcast i8* %call to i32*, !dbg !86
  store i32* %0, i32** %data, align 8, !dbg !87
  %1 = load i32*, i32** %data, align 8, !dbg !88
  %cmp = icmp eq i32* %1, null, !dbg !90
  br i1 %cmp, label %if.then, label %if.end, !dbg !91

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !92
  unreachable, !dbg !92

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !94
  %tobool = icmp ne i32 %call1, 0, !dbg !94
  br i1 %tobool, label %if.then2, label %if.else, !dbg !96

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !97
  br label %if.end4, !dbg !99

if.else:                                          ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !102
  %3 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !109
  %call5 = call i32* @wcscat(i32* %arraydecay, i32* %5) #6, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  call void @printWLine(i32* %6), !dbg !112
  %7 = load i32*, i32** %data, align 8, !dbg !113
  %8 = bitcast i32* %7 to i8*, !dbg !113
  call void @free(i8* %8) #6, !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !116 {
entry:
  ret i32 0, !dbg !117
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !119, metadata !DIExpression()), !dbg !120
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !121
  %0 = bitcast i8* %call to i32*, !dbg !122
  store i32* %0, i32** %data, align 8, !dbg !123
  %1 = load i32*, i32** %data, align 8, !dbg !124
  %cmp = icmp eq i32* %1, null, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !128
  unreachable, !dbg !128

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !130
  %tobool = icmp ne i32 %call1, 0, !dbg !130
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !132

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !133
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !135
  %3 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  br label %if.end4, !dbg !138

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !139, metadata !DIExpression()), !dbg !141
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !141
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !142
  %5 = load i32*, i32** %data, align 8, !dbg !143
  %call5 = call i32* @wcscat(i32* %arraydecay, i32* %5) #6, !dbg !144
  %6 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* %6), !dbg !146
  %7 = load i32*, i32** %data, align 8, !dbg !147
  %8 = bitcast i32* %7 to i8*, !dbg !147
  call void @free(i8* %8) #6, !dbg !148
  ret void, !dbg !149
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08-1.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_bad", scope: !17, file: !17, line: 37, type: !18, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 39, type: !4)
!21 = !DILocation(line: 39, column: 15, scope: !16)
!22 = !DILocation(line: 40, column: 23, scope: !16)
!23 = !DILocation(line: 40, column: 12, scope: !16)
!24 = !DILocation(line: 40, column: 10, scope: !16)
!25 = !DILocation(line: 41, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 9)
!27 = !DILocation(line: 41, column: 14, scope: !26)
!28 = !DILocation(line: 41, column: 9, scope: !16)
!29 = !DILocation(line: 41, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !17, line: 41, column: 23)
!31 = !DILocation(line: 42, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !17, line: 42, column: 8)
!33 = !DILocation(line: 42, column: 8, scope: !16)
!34 = !DILocation(line: 45, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !17, line: 43, column: 5)
!36 = !DILocation(line: 45, column: 9, scope: !35)
!37 = !DILocation(line: 46, column: 9, scope: !35)
!38 = !DILocation(line: 46, column: 21, scope: !35)
!39 = !DILocation(line: 47, column: 5, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !17, line: 49, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !17, line: 48, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 49, column: 17, scope: !41)
!46 = !DILocation(line: 51, column: 16, scope: !41)
!47 = !DILocation(line: 51, column: 22, scope: !41)
!48 = !DILocation(line: 51, column: 9, scope: !41)
!49 = !DILocation(line: 52, column: 20, scope: !41)
!50 = !DILocation(line: 52, column: 9, scope: !41)
!51 = !DILocation(line: 53, column: 14, scope: !41)
!52 = !DILocation(line: 53, column: 9, scope: !41)
!53 = !DILocation(line: 55, column: 1, scope: !16)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_wchar_t_cat_08_good", scope: !17, file: !17, line: 108, type: !18, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 110, column: 5, scope: !54)
!56 = !DILocation(line: 111, column: 5, scope: !54)
!57 = !DILocation(line: 112, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 124, type: !59, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !17, line: 124, type: !7)
!65 = !DILocation(line: 124, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !17, line: 124, type: !61)
!67 = !DILocation(line: 124, column: 27, scope: !58)
!68 = !DILocation(line: 127, column: 22, scope: !58)
!69 = !DILocation(line: 127, column: 12, scope: !58)
!70 = !DILocation(line: 127, column: 5, scope: !58)
!71 = !DILocation(line: 129, column: 5, scope: !58)
!72 = !DILocation(line: 130, column: 5, scope: !58)
!73 = !DILocation(line: 131, column: 5, scope: !58)
!74 = !DILocation(line: 134, column: 5, scope: !58)
!75 = !DILocation(line: 135, column: 5, scope: !58)
!76 = !DILocation(line: 136, column: 5, scope: !58)
!77 = !DILocation(line: 138, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !17, file: !17, line: 25, type: !79, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7}
!81 = !DILocation(line: 27, column: 5, scope: !78)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !17, line: 64, type: !4)
!84 = !DILocation(line: 64, column: 15, scope: !82)
!85 = !DILocation(line: 65, column: 23, scope: !82)
!86 = !DILocation(line: 65, column: 12, scope: !82)
!87 = !DILocation(line: 65, column: 10, scope: !82)
!88 = !DILocation(line: 66, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !17, line: 66, column: 9)
!90 = !DILocation(line: 66, column: 14, scope: !89)
!91 = !DILocation(line: 66, column: 9, scope: !82)
!92 = !DILocation(line: 66, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !17, line: 66, column: 23)
!94 = !DILocation(line: 67, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !82, file: !17, line: 67, column: 8)
!96 = !DILocation(line: 67, column: 8, scope: !82)
!97 = !DILocation(line: 70, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !17, line: 68, column: 5)
!99 = !DILocation(line: 71, column: 5, scope: !98)
!100 = !DILocation(line: 75, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !17, line: 73, column: 5)
!102 = !DILocation(line: 75, column: 9, scope: !101)
!103 = !DILocation(line: 76, column: 9, scope: !101)
!104 = !DILocation(line: 76, column: 20, scope: !101)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !17, line: 79, type: !42)
!106 = distinct !DILexicalBlock(scope: !82, file: !17, line: 78, column: 5)
!107 = !DILocation(line: 79, column: 17, scope: !106)
!108 = !DILocation(line: 81, column: 16, scope: !106)
!109 = !DILocation(line: 81, column: 22, scope: !106)
!110 = !DILocation(line: 81, column: 9, scope: !106)
!111 = !DILocation(line: 82, column: 20, scope: !106)
!112 = !DILocation(line: 82, column: 9, scope: !106)
!113 = !DILocation(line: 83, column: 14, scope: !106)
!114 = !DILocation(line: 83, column: 9, scope: !106)
!115 = !DILocation(line: 85, column: 1, scope: !82)
!116 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !17, file: !17, line: 30, type: !79, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocation(line: 32, column: 5, scope: !116)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DILocalVariable(name: "data", scope: !118, file: !17, line: 90, type: !4)
!120 = !DILocation(line: 90, column: 15, scope: !118)
!121 = !DILocation(line: 91, column: 23, scope: !118)
!122 = !DILocation(line: 91, column: 12, scope: !118)
!123 = !DILocation(line: 91, column: 10, scope: !118)
!124 = !DILocation(line: 92, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !17, line: 92, column: 9)
!126 = !DILocation(line: 92, column: 14, scope: !125)
!127 = !DILocation(line: 92, column: 9, scope: !118)
!128 = !DILocation(line: 92, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !17, line: 92, column: 23)
!130 = !DILocation(line: 93, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !118, file: !17, line: 93, column: 8)
!132 = !DILocation(line: 93, column: 8, scope: !118)
!133 = !DILocation(line: 96, column: 17, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !17, line: 94, column: 5)
!135 = !DILocation(line: 96, column: 9, scope: !134)
!136 = !DILocation(line: 97, column: 9, scope: !134)
!137 = !DILocation(line: 97, column: 20, scope: !134)
!138 = !DILocation(line: 98, column: 5, scope: !134)
!139 = !DILocalVariable(name: "dest", scope: !140, file: !17, line: 100, type: !42)
!140 = distinct !DILexicalBlock(scope: !118, file: !17, line: 99, column: 5)
!141 = !DILocation(line: 100, column: 17, scope: !140)
!142 = !DILocation(line: 102, column: 16, scope: !140)
!143 = !DILocation(line: 102, column: 22, scope: !140)
!144 = !DILocation(line: 102, column: 9, scope: !140)
!145 = !DILocation(line: 103, column: 20, scope: !140)
!146 = !DILocation(line: 103, column: 9, scope: !140)
!147 = !DILocation(line: 104, column: 14, scope: !140)
!148 = !DILocation(line: 104, column: 9, scope: !140)
!149 = !DILocation(line: 106, column: 1, scope: !118)
