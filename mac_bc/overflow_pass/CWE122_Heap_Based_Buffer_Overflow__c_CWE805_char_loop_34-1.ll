; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  store i8* null, i8** %data, align 8, !dbg !28
  %call = call i8* @malloc(i64 noundef 50) #6, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %cmp = icmp eq i8* %0, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion to i8**, !dbg !40
  store i8* %2, i8** %unionFirst, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !42, metadata !DIExpression()), !dbg !44
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion to i8**, !dbg !45
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !45
  store i8* %3, i8** %data1, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !54, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !59
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx2, align 1, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !65
  %cmp3 = icmp ult i64 %4, 100, !dbg !67
  br i1 %cmp3, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !71
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !71
  %7 = load i8*, i8** %data1, align 8, !dbg !72
  %8 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !72
  store i8 %6, i8* %arrayidx5, align 1, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %9, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !81
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !81
  store i8 0, i8* %arrayidx6, align 1, !dbg !82
  %11 = load i8*, i8** %data1, align 8, !dbg !83
  call void @printLine(i8* noundef %11), !dbg !84
  %12 = load i8*, i8** %data1, align 8, !dbg !85
  call void @free(i8* noundef %12), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare void @printLine(i8* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion, metadata !113, metadata !DIExpression()), !dbg !114
  store i8* null, i8** %data, align 8, !dbg !115
  %call = call i8* @malloc(i64 noundef 100) #6, !dbg !116
  store i8* %call, i8** %data, align 8, !dbg !117
  %0 = load i8*, i8** %data, align 8, !dbg !118
  %cmp = icmp eq i8* %0, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  %2 = load i8*, i8** %data, align 8, !dbg !126
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion to i8**, !dbg !127
  store i8* %2, i8** %unionFirst, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !129, metadata !DIExpression()), !dbg !131
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType* %myUnion to i8**, !dbg !132
  %3 = load i8*, i8** %unionSecond, align 8, !dbg !132
  store i8* %3, i8** %data1, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !136, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !138
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !139
  store i8 0, i8* %arrayidx2, align 1, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !144
  %cmp3 = icmp ult i64 %4, 100, !dbg !146
  br i1 %cmp3, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !150
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !150
  %7 = load i8*, i8** %data1, align 8, !dbg !151
  %8 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !151
  store i8 %6, i8* %arrayidx5, align 1, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %9, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !159
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !159
  store i8 0, i8* %arrayidx6, align 1, !dbg !160
  %11 = load i8*, i8** %data1, align 8, !dbg !161
  call void @printLine(i8* noundef %11), !dbg !162
  %12 = load i8*, i8** %data1, align 8, !dbg !163
  call void @free(i8* noundef %12), !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_bad", scope: !15, file: !15, line: 29, type: !16, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 31, type: !3)
!20 = !DILocation(line: 31, column: 12, scope: !14)
!21 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_unionType", file: !15, line: 25, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 21, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !15, line: 23, baseType: !3, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !15, line: 24, baseType: !3, size: 64)
!27 = !DILocation(line: 32, column: 72, scope: !14)
!28 = !DILocation(line: 33, column: 10, scope: !14)
!29 = !DILocation(line: 35, column: 20, scope: !14)
!30 = !DILocation(line: 35, column: 10, scope: !14)
!31 = !DILocation(line: 36, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 9)
!33 = !DILocation(line: 36, column: 14, scope: !32)
!34 = !DILocation(line: 36, column: 9, scope: !14)
!35 = !DILocation(line: 36, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !15, line: 36, column: 23)
!37 = !DILocation(line: 37, column: 5, scope: !14)
!38 = !DILocation(line: 37, column: 13, scope: !14)
!39 = !DILocation(line: 38, column: 26, scope: !14)
!40 = !DILocation(line: 38, column: 13, scope: !14)
!41 = !DILocation(line: 38, column: 24, scope: !14)
!42 = !DILocalVariable(name: "data", scope: !43, file: !15, line: 40, type: !3)
!43 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 16, scope: !43)
!45 = !DILocation(line: 40, column: 31, scope: !43)
!46 = !DILocalVariable(name: "i", scope: !47, file: !15, line: 42, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 41, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 31, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !51, line: 94, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!52 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 42, column: 20, scope: !47)
!54 = !DILocalVariable(name: "source", scope: !47, file: !15, line: 43, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 43, column: 18, scope: !47)
!59 = !DILocation(line: 44, column: 13, scope: !47)
!60 = !DILocation(line: 45, column: 13, scope: !47)
!61 = !DILocation(line: 45, column: 27, scope: !47)
!62 = !DILocation(line: 47, column: 20, scope: !63)
!63 = distinct !DILexicalBlock(scope: !47, file: !15, line: 47, column: 13)
!64 = !DILocation(line: 47, column: 18, scope: !63)
!65 = !DILocation(line: 47, column: 25, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !15, line: 47, column: 13)
!67 = !DILocation(line: 47, column: 27, scope: !66)
!68 = !DILocation(line: 47, column: 13, scope: !63)
!69 = !DILocation(line: 49, column: 34, scope: !70)
!70 = distinct !DILexicalBlock(scope: !66, file: !15, line: 48, column: 13)
!71 = !DILocation(line: 49, column: 27, scope: !70)
!72 = !DILocation(line: 49, column: 17, scope: !70)
!73 = !DILocation(line: 49, column: 22, scope: !70)
!74 = !DILocation(line: 49, column: 25, scope: !70)
!75 = !DILocation(line: 50, column: 13, scope: !70)
!76 = !DILocation(line: 47, column: 35, scope: !66)
!77 = !DILocation(line: 47, column: 13, scope: !66)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 50, column: 13, scope: !63)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 51, column: 13, scope: !47)
!82 = !DILocation(line: 51, column: 25, scope: !47)
!83 = !DILocation(line: 52, column: 23, scope: !47)
!84 = !DILocation(line: 52, column: 13, scope: !47)
!85 = !DILocation(line: 53, column: 18, scope: !47)
!86 = !DILocation(line: 53, column: 13, scope: !47)
!87 = !DILocation(line: 56, column: 1, scope: !14)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_34_good", scope: !15, file: !15, line: 92, type: !16, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!89 = !DILocation(line: 94, column: 5, scope: !88)
!90 = !DILocation(line: 95, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 106, type: !92, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !94, !95}
!94 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !15, line: 106, type: !94)
!97 = !DILocation(line: 106, column: 14, scope: !91)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !15, line: 106, type: !95)
!99 = !DILocation(line: 106, column: 27, scope: !91)
!100 = !DILocation(line: 109, column: 22, scope: !91)
!101 = !DILocation(line: 109, column: 12, scope: !91)
!102 = !DILocation(line: 109, column: 5, scope: !91)
!103 = !DILocation(line: 111, column: 5, scope: !91)
!104 = !DILocation(line: 112, column: 5, scope: !91)
!105 = !DILocation(line: 113, column: 5, scope: !91)
!106 = !DILocation(line: 116, column: 5, scope: !91)
!107 = !DILocation(line: 117, column: 5, scope: !91)
!108 = !DILocation(line: 118, column: 5, scope: !91)
!109 = !DILocation(line: 120, column: 5, scope: !91)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!111 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 65, type: !3)
!112 = !DILocation(line: 65, column: 12, scope: !110)
!113 = !DILocalVariable(name: "myUnion", scope: !110, file: !15, line: 66, type: !22)
!114 = !DILocation(line: 66, column: 72, scope: !110)
!115 = !DILocation(line: 67, column: 10, scope: !110)
!116 = !DILocation(line: 69, column: 20, scope: !110)
!117 = !DILocation(line: 69, column: 10, scope: !110)
!118 = !DILocation(line: 70, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !110, file: !15, line: 70, column: 9)
!120 = !DILocation(line: 70, column: 14, scope: !119)
!121 = !DILocation(line: 70, column: 9, scope: !110)
!122 = !DILocation(line: 70, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !15, line: 70, column: 23)
!124 = !DILocation(line: 71, column: 5, scope: !110)
!125 = !DILocation(line: 71, column: 13, scope: !110)
!126 = !DILocation(line: 72, column: 26, scope: !110)
!127 = !DILocation(line: 72, column: 13, scope: !110)
!128 = !DILocation(line: 72, column: 24, scope: !110)
!129 = !DILocalVariable(name: "data", scope: !130, file: !15, line: 74, type: !3)
!130 = distinct !DILexicalBlock(scope: !110, file: !15, line: 73, column: 5)
!131 = !DILocation(line: 74, column: 16, scope: !130)
!132 = !DILocation(line: 74, column: 31, scope: !130)
!133 = !DILocalVariable(name: "i", scope: !134, file: !15, line: 76, type: !48)
!134 = distinct !DILexicalBlock(scope: !130, file: !15, line: 75, column: 9)
!135 = !DILocation(line: 76, column: 20, scope: !134)
!136 = !DILocalVariable(name: "source", scope: !134, file: !15, line: 77, type: !55)
!137 = !DILocation(line: 77, column: 18, scope: !134)
!138 = !DILocation(line: 78, column: 13, scope: !134)
!139 = !DILocation(line: 79, column: 13, scope: !134)
!140 = !DILocation(line: 79, column: 27, scope: !134)
!141 = !DILocation(line: 81, column: 20, scope: !142)
!142 = distinct !DILexicalBlock(scope: !134, file: !15, line: 81, column: 13)
!143 = !DILocation(line: 81, column: 18, scope: !142)
!144 = !DILocation(line: 81, column: 25, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !15, line: 81, column: 13)
!146 = !DILocation(line: 81, column: 27, scope: !145)
!147 = !DILocation(line: 81, column: 13, scope: !142)
!148 = !DILocation(line: 83, column: 34, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !15, line: 82, column: 13)
!150 = !DILocation(line: 83, column: 27, scope: !149)
!151 = !DILocation(line: 83, column: 17, scope: !149)
!152 = !DILocation(line: 83, column: 22, scope: !149)
!153 = !DILocation(line: 83, column: 25, scope: !149)
!154 = !DILocation(line: 84, column: 13, scope: !149)
!155 = !DILocation(line: 81, column: 35, scope: !145)
!156 = !DILocation(line: 81, column: 13, scope: !145)
!157 = distinct !{!157, !147, !158, !80}
!158 = !DILocation(line: 84, column: 13, scope: !142)
!159 = !DILocation(line: 85, column: 13, scope: !134)
!160 = !DILocation(line: 85, column: 25, scope: !134)
!161 = !DILocation(line: 86, column: 23, scope: !134)
!162 = !DILocation(line: 86, column: 13, scope: !134)
!163 = !DILocation(line: 87, column: 18, scope: !134)
!164 = !DILocation(line: 87, column: 13, scope: !134)
!165 = !DILocation(line: 90, column: 1, scope: !110)
