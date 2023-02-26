; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.myStruct = type { i8*, [4 x i8] }

@.str = private unnamed_addr constant [21 x i8] c"01234567890123456789\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !22 {
entry:
  %structCharVoid = alloca %struct.myStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct.myStruct** %structCharVoid, metadata !26, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 16) #4, !dbg !28
  %0 = bitcast i8* %call to %struct.myStruct*, !dbg !29
  store %struct.myStruct* %0, %struct.myStruct** %structCharVoid, align 8, !dbg !27
  %1 = load %struct.myStruct*, %struct.myStruct** %structCharVoid, align 8, !dbg !30
  %voidSecond = getelementptr inbounds %struct.myStruct, %struct.myStruct* %1, i32 0, i32 0, !dbg !31
  store i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !32
  %2 = load %struct.myStruct*, %struct.myStruct** %structCharVoid, align 8, !dbg !33
  %charFirst = getelementptr inbounds %struct.myStruct, %struct.myStruct* %2, i32 0, i32 1, !dbg !34
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %charFirst, i64 0, i64 0, !dbg !35
  %3 = load %struct.myStruct*, %struct.myStruct** %structCharVoid, align 8, !dbg !36
  %voidSecond1 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %3, i32 0, i32 0, !dbg !37
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 %4, i64 20, i1 false), !dbg !35
  %5 = load %struct.myStruct*, %struct.myStruct** %structCharVoid, align 8, !dbg !38
  %charFirst2 = getelementptr inbounds %struct.myStruct, %struct.myStruct* %5, i32 0, i32 1, !dbg !39
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %charFirst2, i64 0, i64 3, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  ret i32 0, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !9, !15}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "myStruct", file: !6, line: 7, size: 128, elements: !7)
!6 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Memcpy_Overflow_Dst_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !5, file: !6, line: 8, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !5, file: !6, line: 9, baseType: !11, size: 32, offset: 64)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 32, elements: !13)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{!14}
!14 = !DISubrange(count: 4)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 13.0.0"}
!22 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 12, type: !23, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!25}
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DILocalVariable(name: "structCharVoid", scope: !22, file: !6, line: 13, type: !4)
!27 = !DILocation(line: 13, column: 19, scope: !22)
!28 = !DILocation(line: 13, column: 54, scope: !22)
!29 = !DILocation(line: 13, column: 36, scope: !22)
!30 = !DILocation(line: 14, column: 2, scope: !22)
!31 = !DILocation(line: 14, column: 18, scope: !22)
!32 = !DILocation(line: 14, column: 29, scope: !22)
!33 = !DILocation(line: 15, column: 9, scope: !22)
!34 = !DILocation(line: 15, column: 25, scope: !22)
!35 = !DILocation(line: 15, column: 2, scope: !22)
!36 = !DILocation(line: 15, column: 43, scope: !22)
!37 = !DILocation(line: 15, column: 59, scope: !22)
!38 = !DILocation(line: 16, column: 5, scope: !22)
!39 = !DILocation(line: 16, column: 21, scope: !22)
!40 = !DILocation(line: 16, column: 70, scope: !22)
!41 = !DILocation(line: 17, column: 1, scope: !22)
