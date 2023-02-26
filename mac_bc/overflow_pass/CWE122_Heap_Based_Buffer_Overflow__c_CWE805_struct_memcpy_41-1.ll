; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_badSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !20 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !27, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %i, metadata !33, metadata !DIExpression()), !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %0, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !50
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !51
  store i32 0, i32* %intOne, align 8, !dbg !52
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !54
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !55
  store i32 0, i32* %intTwo, align 4, !dbg !56
  br label %for.inc, !dbg !57

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !58
  %inc = add i64 %3, 1, !dbg !58
  store i64 %inc, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !59, !llvm.loop !60

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !63
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !63
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !63
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !63
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !63
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !63
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !63
  %call = call i8* @__memcpy_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #6, !dbg !63
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !64
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !65
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !66
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !66
  call void @free(i8* noundef %12), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_bad() #0 !dbg !69 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !75
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !76
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_badSink(%struct._twoIntsStruct* noundef %2), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_goodG2BSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !87 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %i, metadata !93, metadata !DIExpression()), !dbg !95
  store i64 0, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !98

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !99
  %cmp = icmp ult i64 %0, 100, !dbg !101
  br i1 %cmp, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !105
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !106
  store i32 0, i32* %intOne, align 8, !dbg !107
  %2 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !109
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !110
  store i32 0, i32* %intTwo, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %3, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !117
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !117
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !117
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !117
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !117
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !117
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !117
  %call = call i8* @__memcpy_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #6, !dbg !117
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !118
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !118
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !119
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !120
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !120
  call void @free(i8* noundef %12), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_good() #0 !dbg !123 {
entry:
  call void @goodG2B(), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !126 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !132, metadata !DIExpression()), !dbg !133
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !134, metadata !DIExpression()), !dbg !135
  %call = call i64 @time(i64* noundef null), !dbg !136
  %conv = trunc i64 %call to i32, !dbg !137
  call void @srand(i32 noundef %conv), !dbg !138
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !139
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_good(), !dbg !140
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !141
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !142
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_bad(), !dbg !143
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !144
  ret i32 0, !dbg !145
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !146 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !147, metadata !DIExpression()), !dbg !148
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !149
  %call = call i8* @malloc(i64 noundef 800) #7, !dbg !150
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !151
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !153
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !155
  br i1 %cmp, label %if.then, label %if.end, !dbg !156

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !157
  unreachable, !dbg !157

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !159
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_goodG2BSink(%struct._twoIntsStruct* noundef %2), !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !11, !12}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !5, line: 100, baseType: !6)
!5 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !5, line: 96, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !6, file: !5, line: 98, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !6, file: !5, line: 99, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_badSink", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!21 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!22 = !DISubroutineType(types: !23)
!23 = !{null, !3}
!24 = !{}
!25 = !DILocalVariable(name: "data", arg: 1, scope: !20, file: !21, line: 21, type: !3)
!26 = !DILocation(line: 21, column: 91, scope: !20)
!27 = !DILocalVariable(name: "source", scope: !28, file: !21, line: 24, type: !29)
!28 = distinct !DILexicalBlock(scope: !20, file: !21, line: 23, column: 5)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 24, column: 23, scope: !28)
!33 = !DILocalVariable(name: "i", scope: !34, file: !21, line: 26, type: !35)
!34 = distinct !DILexicalBlock(scope: !28, file: !21, line: 25, column: 9)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 31, baseType: !37)
!36 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !38, line: 94, baseType: !39)
!38 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 26, column: 20, scope: !34)
!41 = !DILocation(line: 28, column: 20, scope: !42)
!42 = distinct !DILexicalBlock(scope: !34, file: !21, line: 28, column: 13)
!43 = !DILocation(line: 28, column: 18, scope: !42)
!44 = !DILocation(line: 28, column: 25, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !21, line: 28, column: 13)
!46 = !DILocation(line: 28, column: 27, scope: !45)
!47 = !DILocation(line: 28, column: 13, scope: !42)
!48 = !DILocation(line: 30, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !21, line: 29, column: 13)
!50 = !DILocation(line: 30, column: 17, scope: !49)
!51 = !DILocation(line: 30, column: 27, scope: !49)
!52 = !DILocation(line: 30, column: 34, scope: !49)
!53 = !DILocation(line: 31, column: 24, scope: !49)
!54 = !DILocation(line: 31, column: 17, scope: !49)
!55 = !DILocation(line: 31, column: 27, scope: !49)
!56 = !DILocation(line: 31, column: 34, scope: !49)
!57 = !DILocation(line: 32, column: 13, scope: !49)
!58 = !DILocation(line: 28, column: 35, scope: !45)
!59 = !DILocation(line: 28, column: 13, scope: !45)
!60 = distinct !{!60, !47, !61, !62}
!61 = !DILocation(line: 32, column: 13, scope: !42)
!62 = !{!"llvm.loop.mustprogress"}
!63 = !DILocation(line: 35, column: 9, scope: !28)
!64 = !DILocation(line: 36, column: 26, scope: !28)
!65 = !DILocation(line: 36, column: 9, scope: !28)
!66 = !DILocation(line: 37, column: 14, scope: !28)
!67 = !DILocation(line: 37, column: 9, scope: !28)
!68 = !DILocation(line: 39, column: 1, scope: !20)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_bad", scope: !21, file: !21, line: 41, type: !70, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !DILocalVariable(name: "data", scope: !69, file: !21, line: 43, type: !3)
!73 = !DILocation(line: 43, column: 21, scope: !69)
!74 = !DILocation(line: 44, column: 10, scope: !69)
!75 = !DILocation(line: 46, column: 29, scope: !69)
!76 = !DILocation(line: 46, column: 12, scope: !69)
!77 = !DILocation(line: 46, column: 10, scope: !69)
!78 = !DILocation(line: 47, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !69, file: !21, line: 47, column: 9)
!80 = !DILocation(line: 47, column: 14, scope: !79)
!81 = !DILocation(line: 47, column: 9, scope: !69)
!82 = !DILocation(line: 47, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !21, line: 47, column: 23)
!84 = !DILocation(line: 48, column: 74, scope: !69)
!85 = !DILocation(line: 48, column: 5, scope: !69)
!86 = !DILocation(line: 49, column: 1, scope: !69)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_goodG2BSink", scope: !21, file: !21, line: 55, type: !22, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!88 = !DILocalVariable(name: "data", arg: 1, scope: !87, file: !21, line: 55, type: !3)
!89 = !DILocation(line: 55, column: 95, scope: !87)
!90 = !DILocalVariable(name: "source", scope: !91, file: !21, line: 58, type: !29)
!91 = distinct !DILexicalBlock(scope: !87, file: !21, line: 57, column: 5)
!92 = !DILocation(line: 58, column: 23, scope: !91)
!93 = !DILocalVariable(name: "i", scope: !94, file: !21, line: 60, type: !35)
!94 = distinct !DILexicalBlock(scope: !91, file: !21, line: 59, column: 9)
!95 = !DILocation(line: 60, column: 20, scope: !94)
!96 = !DILocation(line: 62, column: 20, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !21, line: 62, column: 13)
!98 = !DILocation(line: 62, column: 18, scope: !97)
!99 = !DILocation(line: 62, column: 25, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !21, line: 62, column: 13)
!101 = !DILocation(line: 62, column: 27, scope: !100)
!102 = !DILocation(line: 62, column: 13, scope: !97)
!103 = !DILocation(line: 64, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !21, line: 63, column: 13)
!105 = !DILocation(line: 64, column: 17, scope: !104)
!106 = !DILocation(line: 64, column: 27, scope: !104)
!107 = !DILocation(line: 64, column: 34, scope: !104)
!108 = !DILocation(line: 65, column: 24, scope: !104)
!109 = !DILocation(line: 65, column: 17, scope: !104)
!110 = !DILocation(line: 65, column: 27, scope: !104)
!111 = !DILocation(line: 65, column: 34, scope: !104)
!112 = !DILocation(line: 66, column: 13, scope: !104)
!113 = !DILocation(line: 62, column: 35, scope: !100)
!114 = !DILocation(line: 62, column: 13, scope: !100)
!115 = distinct !{!115, !102, !116, !62}
!116 = !DILocation(line: 66, column: 13, scope: !97)
!117 = !DILocation(line: 69, column: 9, scope: !91)
!118 = !DILocation(line: 70, column: 26, scope: !91)
!119 = !DILocation(line: 70, column: 9, scope: !91)
!120 = !DILocation(line: 71, column: 14, scope: !91)
!121 = !DILocation(line: 71, column: 9, scope: !91)
!122 = !DILocation(line: 73, column: 1, scope: !87)
!123 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_41_good", scope: !21, file: !21, line: 86, type: !70, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!124 = !DILocation(line: 88, column: 5, scope: !123)
!125 = !DILocation(line: 89, column: 1, scope: !123)
!126 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 101, type: !127, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!127 = !DISubroutineType(types: !128)
!128 = !{!9, !9, !129}
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!132 = !DILocalVariable(name: "argc", arg: 1, scope: !126, file: !21, line: 101, type: !9)
!133 = !DILocation(line: 101, column: 14, scope: !126)
!134 = !DILocalVariable(name: "argv", arg: 2, scope: !126, file: !21, line: 101, type: !129)
!135 = !DILocation(line: 101, column: 27, scope: !126)
!136 = !DILocation(line: 104, column: 22, scope: !126)
!137 = !DILocation(line: 104, column: 12, scope: !126)
!138 = !DILocation(line: 104, column: 5, scope: !126)
!139 = !DILocation(line: 106, column: 5, scope: !126)
!140 = !DILocation(line: 107, column: 5, scope: !126)
!141 = !DILocation(line: 108, column: 5, scope: !126)
!142 = !DILocation(line: 111, column: 5, scope: !126)
!143 = !DILocation(line: 112, column: 5, scope: !126)
!144 = !DILocation(line: 113, column: 5, scope: !126)
!145 = !DILocation(line: 115, column: 5, scope: !126)
!146 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 76, type: !70, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !24)
!147 = !DILocalVariable(name: "data", scope: !146, file: !21, line: 78, type: !3)
!148 = !DILocation(line: 78, column: 21, scope: !146)
!149 = !DILocation(line: 79, column: 10, scope: !146)
!150 = !DILocation(line: 81, column: 29, scope: !146)
!151 = !DILocation(line: 81, column: 12, scope: !146)
!152 = !DILocation(line: 81, column: 10, scope: !146)
!153 = !DILocation(line: 82, column: 9, scope: !154)
!154 = distinct !DILexicalBlock(scope: !146, file: !21, line: 82, column: 9)
!155 = !DILocation(line: 82, column: 14, scope: !154)
!156 = !DILocation(line: 82, column: 9, scope: !146)
!157 = !DILocation(line: 82, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !21, line: 82, column: 23)
!159 = !DILocation(line: 83, column: 78, scope: !146)
!160 = !DILocation(line: 83, column: 5, scope: !146)
!161 = !DILocation(line: 84, column: 1, scope: !146)
