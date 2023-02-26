; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp1 = icmp eq i32 %1, 5, !dbg !31
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !32

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !33
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #9, !dbg !33
  %5 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end4, !dbg !37

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !44
  %call5 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #9, !dbg !44
  %8 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* noundef %8), !dbg !46
  %9 = load i8*, i8** %data, align 8, !dbg !47
  call void @free(i8* noundef %9), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #4

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !76
  store i8* %call, i8** %data, align 8, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  %cmp = icmp eq i8* %0, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !84
  %cmp1 = icmp ne i32 %1, 5, !dbg !86
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !87

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end4, !dbg !90

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !91
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !91
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !91
  %5 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !97
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !98
  %7 = load i8*, i8** %data, align 8, !dbg !98
  %call5 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #9, !dbg !98
  %8 = load i8*, i8** %data, align 8, !dbg !99
  call void @printLine(i8* noundef %8), !dbg !100
  %9 = load i8*, i8** %data, align 8, !dbg !101
  call void @free(i8* noundef %9), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !107
  store i8* %call, i8** %data, align 8, !dbg !108
  %0 = load i8*, i8** %data, align 8, !dbg !109
  %cmp = icmp eq i8* %0, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !115
  %cmp1 = icmp eq i32 %1, 5, !dbg !117
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !118

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !119
  %3 = load i8*, i8** %data, align 8, !dbg !119
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !119
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !119
  %5 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  br label %if.end4, !dbg !123

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !124, metadata !DIExpression()), !dbg !126
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !126
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !127
  %7 = load i8*, i8** %data, align 8, !dbg !127
  %call5 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #9, !dbg !127
  %8 = load i8*, i8** %data, align 8, !dbg !128
  call void @printLine(i8* noundef %8), !dbg !129
  %9 = load i8*, i8** %data, align 8, !dbg !130
  call void @free(i8* noundef %9), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 20, scope: !14)
!22 = !DILocation(line: 26, column: 10, scope: !14)
!23 = !DILocation(line: 27, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!25 = !DILocation(line: 27, column: 14, scope: !24)
!26 = !DILocation(line: 27, column: 9, scope: !14)
!27 = !DILocation(line: 27, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 27, column: 23)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 18, scope: !30)
!32 = !DILocation(line: 28, column: 8, scope: !14)
!33 = !DILocation(line: 31, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 9, scope: !34)
!36 = !DILocation(line: 32, column: 21, scope: !34)
!37 = !DILocation(line: 33, column: 5, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 35, column: 14, scope: !39)
!44 = !DILocation(line: 37, column: 9, scope: !39)
!45 = !DILocation(line: 38, column: 19, scope: !39)
!46 = !DILocation(line: 38, column: 9, scope: !39)
!47 = !DILocation(line: 39, column: 14, scope: !39)
!48 = !DILocation(line: 39, column: 9, scope: !39)
!49 = !DILocation(line: 41, column: 1, scope: !14)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_14_good", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!51 = !DILocation(line: 96, column: 5, scope: !50)
!52 = !DILocation(line: 97, column: 5, scope: !50)
!53 = !DILocation(line: 98, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !55, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 110, type: !57)
!60 = !DILocation(line: 110, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 110, type: !58)
!62 = !DILocation(line: 110, column: 27, scope: !54)
!63 = !DILocation(line: 113, column: 22, scope: !54)
!64 = !DILocation(line: 113, column: 12, scope: !54)
!65 = !DILocation(line: 113, column: 5, scope: !54)
!66 = !DILocation(line: 115, column: 5, scope: !54)
!67 = !DILocation(line: 116, column: 5, scope: !54)
!68 = !DILocation(line: 117, column: 5, scope: !54)
!69 = !DILocation(line: 120, column: 5, scope: !54)
!70 = !DILocation(line: 121, column: 5, scope: !54)
!71 = !DILocation(line: 122, column: 5, scope: !54)
!72 = !DILocation(line: 124, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 48, type: !16, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 50, type: !3)
!75 = !DILocation(line: 50, column: 12, scope: !73)
!76 = !DILocation(line: 51, column: 20, scope: !73)
!77 = !DILocation(line: 51, column: 10, scope: !73)
!78 = !DILocation(line: 52, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !15, line: 52, column: 9)
!80 = !DILocation(line: 52, column: 14, scope: !79)
!81 = !DILocation(line: 52, column: 9, scope: !73)
!82 = !DILocation(line: 52, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 52, column: 23)
!84 = !DILocation(line: 53, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !73, file: !15, line: 53, column: 8)
!86 = !DILocation(line: 53, column: 18, scope: !85)
!87 = !DILocation(line: 53, column: 8, scope: !73)
!88 = !DILocation(line: 56, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 54, column: 5)
!90 = !DILocation(line: 57, column: 5, scope: !89)
!91 = !DILocation(line: 61, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !15, line: 59, column: 5)
!93 = !DILocation(line: 62, column: 9, scope: !92)
!94 = !DILocation(line: 62, column: 20, scope: !92)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !15, line: 65, type: !40)
!96 = distinct !DILexicalBlock(scope: !73, file: !15, line: 64, column: 5)
!97 = !DILocation(line: 65, column: 14, scope: !96)
!98 = !DILocation(line: 67, column: 9, scope: !96)
!99 = !DILocation(line: 68, column: 19, scope: !96)
!100 = !DILocation(line: 68, column: 9, scope: !96)
!101 = !DILocation(line: 69, column: 14, scope: !96)
!102 = !DILocation(line: 69, column: 9, scope: !96)
!103 = !DILocation(line: 71, column: 1, scope: !73)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 76, type: !3)
!106 = !DILocation(line: 76, column: 12, scope: !104)
!107 = !DILocation(line: 77, column: 20, scope: !104)
!108 = !DILocation(line: 77, column: 10, scope: !104)
!109 = !DILocation(line: 78, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !15, line: 78, column: 9)
!111 = !DILocation(line: 78, column: 14, scope: !110)
!112 = !DILocation(line: 78, column: 9, scope: !104)
!113 = !DILocation(line: 78, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 78, column: 23)
!115 = !DILocation(line: 79, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !15, line: 79, column: 8)
!117 = !DILocation(line: 79, column: 18, scope: !116)
!118 = !DILocation(line: 79, column: 8, scope: !104)
!119 = !DILocation(line: 82, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !15, line: 80, column: 5)
!121 = !DILocation(line: 83, column: 9, scope: !120)
!122 = !DILocation(line: 83, column: 20, scope: !120)
!123 = !DILocation(line: 84, column: 5, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !125, file: !15, line: 86, type: !40)
!125 = distinct !DILexicalBlock(scope: !104, file: !15, line: 85, column: 5)
!126 = !DILocation(line: 86, column: 14, scope: !125)
!127 = !DILocation(line: 88, column: 9, scope: !125)
!128 = !DILocation(line: 89, column: 19, scope: !125)
!129 = !DILocation(line: 89, column: 9, scope: !125)
!130 = !DILocation(line: 90, column: 14, scope: !125)
!131 = !DILocation(line: 90, column: 9, scope: !125)
!132 = !DILocation(line: 92, column: 1, scope: !104)
