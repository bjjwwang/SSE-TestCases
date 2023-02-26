; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09_bad() #0 !dbg !14 {
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
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !29
  %tobool = icmp ne i32 %1, 0, !dbg !29
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !31

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !32
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #9, !dbg !32
  %5 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %7 = load i8*, i8** %data, align 8, !dbg !43
  %8 = load i8*, i8** %data, align 8, !dbg !43
  %call4 = call i64 @strlen(i8* noundef %8), !dbg !43
  %mul = mul i64 %call4, 1, !dbg !43
  %call5 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #9, !dbg !43
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !44
  store i8 0, i8* %arrayidx6, align 1, !dbg !45
  %9 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* noundef %9), !dbg !47
  %10 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* noundef %10), !dbg !49
  ret void, !dbg !50
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !77
  store i8* %call, i8** %data, align 8, !dbg !78
  %0 = load i8*, i8** %data, align 8, !dbg !79
  %cmp = icmp eq i8* %0, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !85
  %tobool = icmp ne i32 %1, 0, !dbg !85
  br i1 %tobool, label %if.then1, label %if.else, !dbg !87

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end3, !dbg !90

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !91
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !91
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !91
  %5 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !97
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !98
  %7 = load i8*, i8** %data, align 8, !dbg !98
  %8 = load i8*, i8** %data, align 8, !dbg !98
  %call4 = call i64 @strlen(i8* noundef %8), !dbg !98
  %mul = mul i64 %call4, 1, !dbg !98
  %call5 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #9, !dbg !98
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !99
  store i8 0, i8* %arrayidx6, align 1, !dbg !100
  %9 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* noundef %9), !dbg !102
  %10 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* noundef %10), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !109
  store i8* %call, i8** %data, align 8, !dbg !110
  %0 = load i8*, i8** %data, align 8, !dbg !111
  %cmp = icmp eq i8* %0, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !117
  %tobool = icmp ne i32 %1, 0, !dbg !117
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !119

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !120
  %3 = load i8*, i8** %data, align 8, !dbg !120
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !120
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !120
  %5 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  br label %if.end3, !dbg !124

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !127
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !128
  %7 = load i8*, i8** %data, align 8, !dbg !128
  %8 = load i8*, i8** %data, align 8, !dbg !128
  %call4 = call i64 @strlen(i8* noundef %8), !dbg !128
  %mul = mul i64 %call4, 1, !dbg !128
  %call5 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #9, !dbg !128
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !129
  store i8 0, i8* %arrayidx6, align 1, !dbg !130
  %9 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* noundef %9), !dbg !132
  %10 = load i8*, i8** %data, align 8, !dbg !133
  call void @free(i8* noundef %10), !dbg !134
  ret void, !dbg !135
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = !DILocation(line: 28, column: 8, scope: !14)
!32 = !DILocation(line: 31, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !15, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 9, scope: !33)
!35 = !DILocation(line: 32, column: 21, scope: !33)
!36 = !DILocation(line: 33, column: 5, scope: !33)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 14, scope: !38)
!43 = !DILocation(line: 37, column: 9, scope: !38)
!44 = !DILocation(line: 38, column: 9, scope: !38)
!45 = !DILocation(line: 38, column: 20, scope: !38)
!46 = !DILocation(line: 39, column: 19, scope: !38)
!47 = !DILocation(line: 39, column: 9, scope: !38)
!48 = !DILocation(line: 40, column: 14, scope: !38)
!49 = !DILocation(line: 40, column: 9, scope: !38)
!50 = !DILocation(line: 42, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_09_good", scope: !15, file: !15, line: 97, type: !16, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!52 = !DILocation(line: 99, column: 5, scope: !51)
!53 = !DILocation(line: 100, column: 5, scope: !51)
!54 = !DILocation(line: 101, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 113, type: !56, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 113, type: !58)
!61 = !DILocation(line: 113, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 113, type: !59)
!63 = !DILocation(line: 113, column: 27, scope: !55)
!64 = !DILocation(line: 116, column: 22, scope: !55)
!65 = !DILocation(line: 116, column: 12, scope: !55)
!66 = !DILocation(line: 116, column: 5, scope: !55)
!67 = !DILocation(line: 118, column: 5, scope: !55)
!68 = !DILocation(line: 119, column: 5, scope: !55)
!69 = !DILocation(line: 120, column: 5, scope: !55)
!70 = !DILocation(line: 123, column: 5, scope: !55)
!71 = !DILocation(line: 124, column: 5, scope: !55)
!72 = !DILocation(line: 125, column: 5, scope: !55)
!73 = !DILocation(line: 127, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!75 = !DILocalVariable(name: "data", scope: !74, file: !15, line: 51, type: !3)
!76 = !DILocation(line: 51, column: 12, scope: !74)
!77 = !DILocation(line: 52, column: 20, scope: !74)
!78 = !DILocation(line: 52, column: 10, scope: !74)
!79 = !DILocation(line: 53, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !74, file: !15, line: 53, column: 9)
!81 = !DILocation(line: 53, column: 14, scope: !80)
!82 = !DILocation(line: 53, column: 9, scope: !74)
!83 = !DILocation(line: 53, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 53, column: 23)
!85 = !DILocation(line: 54, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !74, file: !15, line: 54, column: 8)
!87 = !DILocation(line: 54, column: 8, scope: !74)
!88 = !DILocation(line: 57, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !15, line: 55, column: 5)
!90 = !DILocation(line: 58, column: 5, scope: !89)
!91 = !DILocation(line: 62, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !15, line: 60, column: 5)
!93 = !DILocation(line: 63, column: 9, scope: !92)
!94 = !DILocation(line: 63, column: 20, scope: !92)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !15, line: 66, type: !39)
!96 = distinct !DILexicalBlock(scope: !74, file: !15, line: 65, column: 5)
!97 = !DILocation(line: 66, column: 14, scope: !96)
!98 = !DILocation(line: 68, column: 9, scope: !96)
!99 = !DILocation(line: 69, column: 9, scope: !96)
!100 = !DILocation(line: 69, column: 20, scope: !96)
!101 = !DILocation(line: 70, column: 19, scope: !96)
!102 = !DILocation(line: 70, column: 9, scope: !96)
!103 = !DILocation(line: 71, column: 14, scope: !96)
!104 = !DILocation(line: 71, column: 9, scope: !96)
!105 = !DILocation(line: 73, column: 1, scope: !74)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!107 = !DILocalVariable(name: "data", scope: !106, file: !15, line: 78, type: !3)
!108 = !DILocation(line: 78, column: 12, scope: !106)
!109 = !DILocation(line: 79, column: 20, scope: !106)
!110 = !DILocation(line: 79, column: 10, scope: !106)
!111 = !DILocation(line: 80, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !15, line: 80, column: 9)
!113 = !DILocation(line: 80, column: 14, scope: !112)
!114 = !DILocation(line: 80, column: 9, scope: !106)
!115 = !DILocation(line: 80, column: 24, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !15, line: 80, column: 23)
!117 = !DILocation(line: 81, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !106, file: !15, line: 81, column: 8)
!119 = !DILocation(line: 81, column: 8, scope: !106)
!120 = !DILocation(line: 84, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !15, line: 82, column: 5)
!122 = !DILocation(line: 85, column: 9, scope: !121)
!123 = !DILocation(line: 85, column: 20, scope: !121)
!124 = !DILocation(line: 86, column: 5, scope: !121)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !15, line: 88, type: !39)
!126 = distinct !DILexicalBlock(scope: !106, file: !15, line: 87, column: 5)
!127 = !DILocation(line: 88, column: 14, scope: !126)
!128 = !DILocation(line: 90, column: 9, scope: !126)
!129 = !DILocation(line: 91, column: 9, scope: !126)
!130 = !DILocation(line: 91, column: 20, scope: !126)
!131 = !DILocation(line: 92, column: 19, scope: !126)
!132 = !DILocation(line: 92, column: 9, scope: !126)
!133 = !DILocation(line: 93, column: 14, scope: !126)
!134 = !DILocation(line: 93, column: 9, scope: !126)
!135 = !DILocation(line: 95, column: 1, scope: !106)
