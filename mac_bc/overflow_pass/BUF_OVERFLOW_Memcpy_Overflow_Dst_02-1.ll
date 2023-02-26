; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.myStruct = type { i8*, [4 x i8] }

@.str = private unnamed_addr constant [21 x i8] c"01234567890123456789\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !22 {
entry:
  %structCharVoid = alloca %struct.myStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct.myStruct** %structCharVoid, metadata !27, metadata !DIExpression()), !dbg !28
  %call = call i8* @malloc(i64 noundef 16) #4, !dbg !29
  %0 = bitcast i8* %call to %struct.myStruct*, !dbg !30
  store %struct.myStruct* %0, %struct.myStruct** %structCharVoid, align 8, !dbg !28
  %1 = load %struct.myStruct*, %struct.myStruct** %structCharVoid, align 8, !dbg !31
  %voidSecond = getelementptr inbounds %struct.myStruct, %struct.myStruct* %1, i32 0, i32 0, !dbg !32
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !33
  %2 = load %struct.myStruct*, %struct.myStruct** %structCharVoid, align 8, !dbg !34
  %charFirst = getelementptr inbounds %struct.myStruct, %struct.myStruct* %2, i32 0, i32 1, !dbg !34
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %charFirst, i64 0, i64 0, !dbg !34
  %3 = load %struct.myStruct*, %struct.myStruct** %structCharVoid, align 8, !dbg !34
  %voidSecond1 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %3, i32 0, i32 0, !dbg !34
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !34
  %5 = load %struct.myStruct*, %struct.myStruct** %structCharVoid, align 8, !dbg !34
  %charFirst2 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %5, i32 0, i32 1, !dbg !34
  %arraydecay3 = getelementptr inbounds [4 x i8], [4 x i8]* %charFirst2, i64 0, i64 0, !dbg !34
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %arraydecay3, i1 false, i1 true, i1 false), !dbg !34
  %call4 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %4, i64 noundef 20, i64 noundef %6) #5, !dbg !34
  %7 = load %struct.myStruct*, %struct.myStruct** %structCharVoid, align 8, !dbg !35
  %charFirst5 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %7, i32 0, i32 1, !dbg !36
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %charFirst5, i64 0, i64 3, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  ret i32 0, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !8, !14}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "myStruct", file: !5, line: 7, size: 128, elements: !6)
!5 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !{!7, !9}
!7 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !4, file: !5, line: 8, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !4, file: !5, line: 9, baseType: !10, size: 32, offset: 64)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 32, elements: !12)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 4)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Homebrew clang version 14.0.6"}
!22 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 12, type: !23, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !26)
!23 = !DISubroutineType(types: !24)
!24 = !{!25}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{}
!27 = !DILocalVariable(name: "structCharVoid", scope: !22, file: !5, line: 13, type: !3)
!28 = !DILocation(line: 13, column: 19, scope: !22)
!29 = !DILocation(line: 13, column: 54, scope: !22)
!30 = !DILocation(line: 13, column: 36, scope: !22)
!31 = !DILocation(line: 14, column: 2, scope: !22)
!32 = !DILocation(line: 14, column: 18, scope: !22)
!33 = !DILocation(line: 14, column: 29, scope: !22)
!34 = !DILocation(line: 15, column: 2, scope: !22)
!35 = !DILocation(line: 16, column: 5, scope: !22)
!36 = !DILocation(line: 16, column: 21, scope: !22)
!37 = !DILocation(line: 16, column: 70, scope: !22)
!38 = !DILocation(line: 17, column: 1, scope: !22)
